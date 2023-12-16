import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_f_test/core/app_theme.dart';
import 'package:firebase_f_test/src/controller/auth_controller.dart';
import 'package:firebase_f_test/src/controller/fire_store_controller.dart';
import 'package:firebase_f_test/src/controller/home_controller.dart';
import 'package:firebase_f_test/src/controller/item_controller.dart';
import 'package:firebase_f_test/src/controller/recommendation_controller.dart';
import 'package:firebase_f_test/src/view/screens/auth_screens/login_screen.dart';
import 'package:firebase_f_test/src/view/screens/material_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<AuthController>(AuthController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialBinding: BindingsBuilder(() {
        Get.put<AuthController>(AuthController());
        Get.put<FireStoreController>(FireStoreController());
        Get.put<HomeController>(HomeController());
        Get.put<ItemController>(ItemController());
        Get.put<RecommendationController>(RecommendationController());
      }),
      home: GetX<AuthController>(
        init: _authController,
        builder: (_) {
          return _.user.value == null ? LoginView() : MaterialHomeView();
        },
      ),
    );
  }
}
