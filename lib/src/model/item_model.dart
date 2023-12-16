
//model
import 'dart:convert';

class Items {
  int id;
  String name;
  String weight;
  String gender;

  Items({required this.id, required this.name, required this.weight, required this.gender});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['ID'],
      name: json['Name'],
      weight: json['Weight'],
      gender: json['Gender'],
    );
  }
}

List<Items> itemFromJson(Object jsonString) {
  final data = json.decode(jsonString as String);
  return List<Items>.from(data.map((item) => Items.fromJson(item)));
}

