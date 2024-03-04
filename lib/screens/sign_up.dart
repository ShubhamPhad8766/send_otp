// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_api/utils/route/routes.dart';
import 'package:otp_api/widgets/clip_path.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 100.0.h,
                    color: const Color.fromARGB(247, 0, 0, 0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 10),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              width: 5.0.w,
                              height: 100.0.h,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "2ByteCode's",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "FLUTTER",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "academy",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'SIGN UP',
                        style: TextStyle(
                            fontSize: 50.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Hey!Enter Your Details and create an account',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter your Full name',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter your email address',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.remove_red_eye),
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      const Text(
                        "By signing in you are agreeing to our privacy \npolicy and terms & conditions",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: const Size(600, 50),
                          ),
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already a user?",
                              style: TextStyle(color: Colors.grey)),
                          InkWell(
                            onTap: () {
                              context.push(AppRoutes.otpscreen);
                            },
                            child: const Text("Login Here",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
