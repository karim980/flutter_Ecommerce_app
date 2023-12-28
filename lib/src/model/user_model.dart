import 'package:flutter/cupertino.dart';

class UserModel {
  final String fullName;
  final String age;
  final String gender;
  final String height;
  final String weight;
  final List<Map<String, dynamic>> favourites;
  final List<Map<String, dynamic>> cart;

  void addToAddFavourite(Map<String, dynamic> product) => favourites.add(product);
  void addToAddCart(Map<String, dynamic> product) => cart.add(product);

  UserModel({
    required this.fullName,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.favourites,
    required this.cart,
  });
}
