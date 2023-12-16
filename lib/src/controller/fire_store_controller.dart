import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FireStoreController extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference cart = FirebaseFirestore.instance.collection('users/UtAhGz0dXDcbups403eg/cart');

  Future<void> addUser({
    required String name,
    required String age,
    required String weight,
    required String height,
    required String gender,
  }) {
    return users
        .add({
          'full_name': name,
          'age': age,
          'weight': weight,
          'height': height,
          'gender': gender,
        })
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Future<void> addToCart({
    required String name,
    required String image,
    required String price,
    required String gender,
  }) {
    return cart
        .add({
          'full_name': name,
          'gender': gender,
          'price': price,
          'image': image,
        })
        .then((value) => debugPrint("Added to cart"))
        .catchError((error) => debugPrint("Failed to add cart: $error"));
  }


}
