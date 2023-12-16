import 'package:firebase_f_test/core/strings/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/fire_store_controller.dart';
import '../../widgets/defult_text_form_feild.dart';

class SignUpView extends StatelessWidget {
  final AuthController _authController = Get.find();
  final FireStoreController _fireStoreController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sebastian-pociecha.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
              child: Card(color: Colors.white30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      type: TextInputType.emailAddress,
                      controller: _emailController,
                      hintText: AppStrings.email,
                    ),
                    CustomTextFormField(
                      controller: _name,
                      hintText: 'Name',
                    ),
                    CustomTextFormField(
                      controller: _age,
                      hintText: 'Age',
                    ),
                    CustomTextFormField(
                      controller: _gender,
                      hintText: 'Gender',
                    ),
                    CustomTextFormField(
                      controller: _height,
                      hintText: 'Height',
                    ),
                    CustomTextFormField(
                      controller: _weight,
                      hintText: 'Weight',
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: AppStrings.password,
                      obscureText: true,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: AppStrings.confirmPassword,
                      obscureText: true,
                    ),
                   const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async{
                        _authController.signUp(
                            email: _emailController.text,
                            password: _passwordController.text);
                       await _fireStoreController.addUser(
                            name: _name.text,
                            age: _age.text,
                            weight: _weight.text,
                            height: _height.text,
                            gender: _gender.text);

                        Get.back();
                      },
                      child: Text(AppStrings.signUpButton),
                    ),
                   const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('you already have an account? Sign in'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
