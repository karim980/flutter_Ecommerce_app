import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserController {
  late UserModel user;

  Future<UserModel?> getUserInformation(String userId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        user = UserModel(
          fullName: data['full_name'],
          age: data['age'],
          gender: data['gender'],
          height: data['height'],
          weight: data['weight'],
          favourites: List.from(data['favourite']),
          cart: List.from(data['cart']),
        );
        return user;
      } else {
        return null;
      }
    } catch (error) {
      print('Error retrieving user information: $error');
      return null;
    }
  }
}
