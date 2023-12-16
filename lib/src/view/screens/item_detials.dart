import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/fire_store_controller.dart';

class ItemDetails extends StatelessWidget {
  final FireStoreController _fireStoreController = Get.find();
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
          child: Column(
        children: [
          Expanded(child: Image(image: AssetImage(img))),

          Spacer(),
          ElevatedButton(onPressed: () {
            _fireStoreController.addToCart(name: name, price: price, gender: gender, image:img);
          }, child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add to cart'),
              SizedBox(width: 10,),
              Icon(CupertinoIcons.cart)
            ],
          ))
        ],
      )),
    );
  }
}
