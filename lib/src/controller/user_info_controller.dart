import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class UserController {
  final user = FirebaseAuth.instance.currentUser;

  Future<UserModel?> getUserInformation() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('UtAhGz0dXDcbups403eg')
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return UserModel(
          fullName: data['full_name'],
          age: data['age'],
          gender: data['gender'],
          height: data['height'],
          weight: data['weight'],
        );
      } else {
        return null;
      }
    } catch (error) {
      print('Error retrieving user information: $error');
      return null;
    }
  }
}
