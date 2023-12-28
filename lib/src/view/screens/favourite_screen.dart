import 'package:firebase_f_test/core/colors/app_color.dart';
import 'package:firebase_f_test/src/controller/auth_controller.dart';
import 'package:firebase_f_test/src/view/widgets/button_widget.dart';
import 'package:firebase_f_test/src/view/widgets/fav_widget.dart';
import 'package:firebase_f_test/src/view/widgets/number_widget.dart';
import 'package:firebase_f_test/src/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/strings/app_string.dart';
import '../../controller/user_info_controller.dart';
import '../../model/user_model.dart';

class FavouriteScreen extends StatelessWidget {
  final UserController _controller = UserController();
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel?>(
        future: _controller.getUserInformation(_authController.userId!),
        builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.hasError) {
            Get.defaultDialog(
                title: 'Something went wrong',
                cancel: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('cancel')));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            Get.defaultDialog(
                title: 'User not found',
                cancel: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('cancel')));
          }

          UserModel user = snapshot.data!;

          return SafeArea(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FavWidget(
                  image: user.favourites[index]['image'],
                  name:  user.favourites[index]['name'],
                  gender:  user.favourites[index]['gender'],
                  price:  user.favourites[index]['price']);
            },
            itemCount: user.favourites.length,
          ));
        },
      ),
    );
  }
}
