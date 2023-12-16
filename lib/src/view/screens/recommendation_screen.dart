import 'package:firebase_f_test/src/model/measure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/recommendation_controller.dart';
import '../../model/recommendation_model.dart';
import 'item_detials.dart';

class RecommendationScreen extends StatelessWidget {
  final RecommendationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Set the number of columns in the grid
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 3 / 5),
                itemCount: controller.recommendation.length - 3,
                itemBuilder: (context, index) {
                  Recommendations recommendation =
                      controller.recommendation[index];
                  var imageList = RecommendationImage.recommendation;
                  return InkWell(
                    onTap: () {
                      Get.to(ItemDetails(
                        img: imageList[index]['image'],
                        name: recommendation.name,
                        price: recommendation.id.toString(),
                        gender: recommendation.gender,
                      ));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage(imageList[index]['image']),
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.fill),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(recommendation.name),
                                SizedBox(height: 5,),
                                Text(recommendation.gender),
                                SizedBox(height: 5,),
                                Text(recommendation.category),
                                SizedBox(height: 5,),
                                Text(recommendation.recommendedBrand),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
