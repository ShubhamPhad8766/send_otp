import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_api/cubit/cubit/send_otp_cubit.dart';
import 'package:otp_api/preferance/preferance.dart';
import 'package:otp_api/utils/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await LocalStorageUtils.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SendOtpCubit(),
      ),
      BlocProvider(
        create: (context) => SendOtpCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRoutes = AppRoutes();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'PostApi',
        routeInformationParser: appRoutes.router.routeInformationParser,
        routeInformationProvider: appRoutes.router.routeInformationProvider,
        routerDelegate: appRoutes.router.routerDelegate,
      ),
    );
  }
}
