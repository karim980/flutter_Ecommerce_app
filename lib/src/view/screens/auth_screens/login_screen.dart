import 'package:firebase_f_test/core/colors/app_color.dart';
import 'package:firebase_f_test/core/strings/app_string.dart';
import 'package:firebase_f_test/src/view/screens/auth_screens/signup_screen.dart';
import 'package:firebase_f_test/src/view/screens/material_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../widgets/defult_text_form_feild.dart';


class LoginView extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/sebastian-pociecha.jpg', // Replace with your image asset path
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(color: Colors.white38,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 20),
                        child: Image.asset('assets/LC_Waikiki_logo.png'),
                      ),
                      CustomTextFormField(
                        type: TextInputType.emailAddress,
                        controller: _emailController,
                        hintText: AppStrings.email,
                      ),
                      CustomTextFormField(
                        controller: _passwordController,
                        hintText: AppStrings.password,
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                         var sign= _authController.signIn(
                            _emailController.text,
                            _passwordController.text,
                          );
                         if(sign == null){
                           Get.offAll(MaterialHomeView());
                         }
                        },
                        child: Text(AppStrings.signInButton),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignUpView());
                        },
                        child: Text('Don\'t have an account? Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
