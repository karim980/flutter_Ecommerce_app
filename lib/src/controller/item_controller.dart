import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_f_test/src/model/recommendation_model.dart';
import 'package:get/get.dart';

import '../model/item_model.dart';

class ItemHelper {

  static Future<List<Items>?> getData({required String path}) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('$path').get();
    if (snapshot.exists) {
      var jsonString = json.encode(snapshot.value);
      return itemFromJson(jsonString);
    } else {
      print('No data available.');
    }
    return null;
  }
}

class ItemController extends GetxController {
  var item = <Items>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    isLoading(true);
    try {
      var itemList = await ItemHelper.getData(path: 'data');
      if (itemList != null) {
        item.assignAll(itemList);
      }
    } finally {
      isLoading(false);
    }
  }
}
