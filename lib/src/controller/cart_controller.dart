import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_f_test/src/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<String> cartItems = <String>[].obs;

  // Function to add item to the cart
  void addItemToCart(String itemId) {
    cartItems.add(itemId);
  }

  Future<List<Cart>?> fetchCartData({required String userId}) async {
    try {
      QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('users/cart/$userId').get();
      if (snapshot != null){
        Map<String, dynamic> data = snapshot as Map<String, dynamic>;
      }

    } catch (e) {
      print('Error fetching cart data: $e');
    }
  }
}