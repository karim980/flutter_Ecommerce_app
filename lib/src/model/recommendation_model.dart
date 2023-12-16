import 'dart:convert';

class Recommendations {
  int id;
  String name;
  String gender;
  String category;
  String recommendedBrand;

  Recommendations({
    required this.id,
    required this.name,
    required this.gender,
    required this.category,
    required this.recommendedBrand,
  });
  factory Recommendations.fromJson(Map<String, dynamic> json) {
    return Recommendations(
      id: json['ID'],
      name: json['Name'],
      gender: json['Gender'],
      category: json['Category'],
      recommendedBrand: json['Recommended Brand']
    );
  }
}

List<Recommendations> recommendationsFromJson(Object jsonString) {
  final data = json.decode(jsonString as String);
  return List<Recommendations>.from(data.map((recommendations) => Recommendations.fromJson(recommendations)));
}

