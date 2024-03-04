// ignore_for_file: unnecessary_import, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_api/utils/route/routes.dart';
import 'package:otp_api/widgets/clip_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                          const SizedBox(
                            width: 10.0,
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
                              Text(
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
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 50.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Welcome back,login to your account',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter your email address',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      TextField(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'Forgot Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: Size(600, 50),
                          ),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("New User?",
                              style: TextStyle(color: Colors.grey)),
                          InkWell(
                            onTap: () {
                              context.push(AppRoutes.signupscreen);
                            },
                            child: Text(" Create Account",
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
