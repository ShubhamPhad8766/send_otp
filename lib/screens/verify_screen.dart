// ignore_for_file: unnecessary_import, unused_import, unused_local_variable, sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_api/cubit/cubit/send_otp_cubit.dart';
import 'package:otp_api/utils/snakbar/snakbar.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyScreen extends StatefulWidget {
  final String phoneNumber;

  const VerifyScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  // final TextEditingController otpController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      appBar: AppBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        centerTitle: true,
        title: const Text(
          'Verify Screen',
        ),
      ),
      body: BlocConsumer<SendOtpCubit, SendOtpState>(
        listener: (context, state) {
          if (state is VerifySuccess) {
            SnackBarWidget.showSnackbar(context, 'Verification Successful!');
          } else if (state is VerifyError) {
            SnackBarWidget.showSnackbar(context, 'Verification Error');
          } else if (state is VerifyOtpUserNotExists) {
            SnackBarWidget.showSnackbar(context, 'User Not Found');
          }
        },
        builder: (context, state) {
          if (state is VerifyLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Enter OTP '),
                const SizedBox(
                  height: 20,
                ),
                const CustomOtpTextField(
                  length: 6,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // int otpvalue = int.parse(otpController.text.trim());
                    context.read<SendOtpCubit>().verifyOtp(
                        phoneNumber: widget.phoneNumber, otp: 417620);
                  },
                  child: const Text("Verify OTP"),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class CustomOtpTextField extends StatelessWidget {
  final int length;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const CustomOtpTextField({
    super.key,
    required this.length,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(length, (index) {
          return SizedBox(
            width: 40.0,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged!(controller!.text);
                }
              },
              decoration: InputDecoration(
                counter: const Offstage(),
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
