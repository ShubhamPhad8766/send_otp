import 'package:go_router/go_router.dart';
import 'package:otp_api/screens/login_1.dart';
import 'package:otp_api/screens/otp_screen.dart';
import 'package:otp_api/screens/sign_up.dart';
import 'package:otp_api/screens/splash_screen.dart';

class AppRoutes {
  static const String otpscreen = '/otp-screen';
  static const String verifyScreen = '/verify-screen';
  static const String loginscreen = '/login-screen';
  static const String signupscreen = '/signup-screen';

  GoRouter get router => _goRouter;
  late final GoRouter _goRouter =
      GoRouter(initialLocation: loginscreen, routes: [
    GoRoute(
      path: otpscreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: otpscreen,
      builder: (context, state) => const SendOtpScreen(),
    ),
    GoRoute(
      path: loginscreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: signupscreen,
      builder: (context, state) => const SignUpScreen(),
    ),
  ]);
}
