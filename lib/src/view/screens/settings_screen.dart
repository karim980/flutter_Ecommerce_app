import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../widgets/settings_widget.dart';
import 'auth_screens/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  final AuthController _authController = Get.find();
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image(image: AssetImage('assets/shopping-cart.png'),width: 200,),
            SizedBox(height: 30,),
            SettingsWidget(icon: Icons.logout, text: 'log out',onPress: (){
              _authController.signOut();
              Get.back();
            }),
          ],
        ),
      ),
    );
  }
}
