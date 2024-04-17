import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../app_route/app_route.dart';
import '../../../controller/local/enums.dart';
import '../../../controller/local/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 6010),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context,
            MyCache.getBoolean(key: MyCacheKeys.onBoarding)
                ? AppRouters.layoutPageRoute
                : AppRouters.onboardPageRoute,
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/splash_blue_logo.gif',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
