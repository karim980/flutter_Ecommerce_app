import 'package:firebase_f_test/src/view/screens/recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/colors/app_color.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
     Get.offAll(RecommendationScreen());
    });
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('e commerce app',style: TextStyle(color: AppColors.whiteColor,fontSize: 38,fontWeight: FontWeight.w500),),
          Text('',style: TextStyle(color: AppColors.whiteColor,fontSize: 30,fontWeight: FontWeight.w400)),
          Image.asset('assets/shopping-cart.png'),
          SpinKitSpinningLines(
            color: AppColors.whiteColor,
            size: 200.0,
          ),
        ],
      ),
    );
  }
}
