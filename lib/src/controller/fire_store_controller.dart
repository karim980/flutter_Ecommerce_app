import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FireStoreController extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser({
    required String name,
    required String age,
    required String weight,
    required String height,
    required String gender,
    required String docId,
  }) {
    return users
        .doc(docId)
        .set({
          'full_name': name,
          'age': age,
          'weight': weight,
          'height': height,
          'gender': gender,
          'favourite': [],
          'cart': [],
        })
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Future<void> addToFavourite({
    required String docId,
    required List<Map<String, dynamic>> favourites,
  }) {
    return users
        .doc(docId)
        .update({'favourite': favourites})
        .then((value) => debugPrint("Added to fav"))
        .catchError((error) => debugPrint("Failed to add fav: $error"));
  }

  Future<void> addToCart({
    required String docId,
    required List<Map<String, dynamic>> cart,
  }) {
    return users
        .doc(docId)
        .update({'cart': cart})
        .then((value) => debugPrint("Added to cart"))
        .catchError((error) => debugPrint("Failed to add cart: $error"));
  }
}
