
//model
import 'dart:convert';

class Cart {
  String name;
  String price;
  String gender;
  String image;

  Cart({required this.image, required this.name, required this.price, required this.gender});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      image: json['image'],
      name: json['Name'],
      price: json['Price'],
      gender: json['Gender'],
    );
  }
}

List<Cart> cartFromJson(Object jsonString) {
  final data = json.decode(jsonString as String);
  return List<Cart>.from(data.map((cart) => Cart.fromJson(cart)));
}

