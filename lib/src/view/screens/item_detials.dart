import 'package:firebase_f_test/src/controller/user_info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../controller/fire_store_controller.dart';

class ItemDetails extends StatelessWidget {
  final FireStoreController _fireStoreController = Get.find();
  final AuthController _authController = AuthController();
  final UserController _userController = UserController();
  String img;
  String name;
  String price;
  String gender;

  ItemDetails({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
        children: [
            Expanded(child: Image(image: AssetImage(img),width: double.infinity,)),
            SizedBox(
              height: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () async {
                      await _userController
                          .getUserInformation(_authController.userId!);
                      _userController.user.addToAddFavourite({
                        'name': name,
                        'gender': gender,
                        'price': price,
                        'image': img,
                      });
                      _fireStoreController.addToFavourite(
                        favourites: _userController.user.favourites,
                        docId: _authController.userId!,
                      );
                    },
                    icon: Icon(Icons.favorite)),
                Text(name),
                Text(gender),
                Text(price),

              ],
            ),
          SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () async {
                  await _userController
                      .getUserInformation(_authController.userId!);
                  _userController.user.addToAddCart({
                    'name': name,
                    'gender': gender,
                    'price': price,
                    'image': img,
                  });
                  _fireStoreController.addToCart(
                    cart: _userController.user.favourites,
                    docId: _authController.userId!,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add to cart'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(CupertinoIcons.cart)
                  ],
                )),
          SizedBox(height: 15,)
        ],
      ),
          )),
    );
  }
}
