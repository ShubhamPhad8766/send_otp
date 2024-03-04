// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_api/screens/otp_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    // context.go(AppRoutes.otpscreen);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SendOtpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      body: Center(child: Lottie.asset('assets/loti1.json')),
    );
  }
}
