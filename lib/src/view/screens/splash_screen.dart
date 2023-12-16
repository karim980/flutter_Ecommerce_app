import 'package:firebase_f_test/core/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  Widget page;
  int time;

  SplashScreen({
    super.key,
    required this.page,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: time), () {
      Get.offAll(page);
    });
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: SpinKitFadingCircle(
          color: AppColors.thrColor,
          size: 100.0,
        ),
      ),
    );
  }
}
