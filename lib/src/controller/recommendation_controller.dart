import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../model/recommendation_model.dart';

class RecommendationHelper{
  static Future<List<Recommendations>?> getData({required String path}) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('$path').get();
    if (snapshot.exists) {
      var jsonString = json.encode(snapshot.value);
      return recommendationsFromJson(jsonString);
    } else {
      print('No data available.');
    }
    return null;
  }
}

class RecommendationController extends GetxController {
  var recommendation = <Recommendations>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRecommendation();
    super.onInit();
  }

  void fetchRecommendation() async {
    isLoading(true);
    try {
      var recommendationList = await RecommendationHelper.getData(path: 'recommendation');
      if (recommendationList != null) {
        recommendation.assignAll(recommendationList);
      }
    } finally {
      isLoading(false);
    }
  }
}