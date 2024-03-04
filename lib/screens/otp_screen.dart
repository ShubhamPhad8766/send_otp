// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_api/cubit/cubit/send_otp_cubit.dart';
import 'package:otp_api/screens/verify_screen.dart';
import 'package:otp_api/utils/snakbar/snakbar.dart';
import 'package:otp_api/widgets/textform_fild.dart';

class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({
    super.key,
  });

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    VerifyScreen(phoneNumber: phonenumber.text.trim()),
              ));
        } else if (state is SendOtpError) {
          SnackBarWidget.showSnackbar(context, state.errorMessage ?? "");
        }
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        appBar: AppBar(
          backgroundColor: CupertinoColors.lightBackgroundGray,
          centerTitle: true,
          title: const Text("Send OTP"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const FlutterLogo(
                  size: 100,
                  textColor: Colors.cyan,
                ),
                BlocBuilder<SendOtpCubit, SendOtpState>(
                  builder: (context, state) {
                    return Form(
                        key: formkey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormFieldWidget(
                          controller: phonenumber,
                          hintText: "Enter Your Phone Number",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid Number';
                            }
                            if (value.length != 10) {
                              return "Please enter a valid Number";
                            }
                            return null;
                          },
                          suffixIcon: InkWell(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                final phoneNumberText = phonenumber.text.trim();
                                if (phoneNumberText.isNotEmpty) {
                                  context.read<SendOtpCubit>().sendotp(
                                        int.parse(phoneNumberText),
                                        context,
                                      );
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                } else {}
                              }
                            },
                            child: state is SendOtpLoading
                                ? const CircularProgressIndicator()
                                : const Icon(Icons.arrow_forward_ios),
                          ),
                        ));
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyScreen(
                                    phoneNumber: phonenumber.text,
                                  )
                              // VerifyScreen(
                              //     phoneNumber: phonenumber.text.trim()),
                              ));
                    },
                    child: const Text("Next")),
              ]),
        ),
      )),
    );
  }
}
