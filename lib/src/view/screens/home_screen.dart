import 'package:firebase_f_test/src/model/measure.dart';
import 'package:firebase_f_test/src/view/screens/item_detials.dart';
import 'package:firebase_f_test/src/view/screens/recommendation_screen.dart';
import 'package:firebase_f_test/src/view/screens/user_detials.dart';
import 'package:firebase_f_test/src/view/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/item_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Get.to(UserInformation());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: CircleAvatar(
                  radius: 28,
                  backgroundImage:
                      AssetImage('assets/FB_IMG_1659972169968.jpg')),
            ),
          )
        ],
      ),
      body: Obx(() {
        var getItem = Get.find<ItemController>().item;
        var imageList = MeasureImage.measure;
        var price='899 EG';
        if (Get.find<ItemController>().isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Row(
                    children: [
                      SizedBox(),
                      Spacer(),
                      Icon(Icons.arrow_forward_outlined),
                    ],
                  ),
                ),
                SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => RecommendationScreen());
                    },
                    child: Row(
                      children: [
                        Image(image: AssetImage('assets/man-img.jpg'),height: 150,),
                        Image(image: AssetImage('assets/weman-img.jpg'),height: 150,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,top: 30),
                  child: Text('Collection',style: TextStyle(fontSize: 25),),
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: imageList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(ItemDetails(
                          img: imageList[index]['image'],
                          name: getItem[index].name,
                          price: price,
                          gender: getItem[index].gender,
                        ));
                      },
                      child: ItemWidget(
                        title: getItem[index].name,
                        img: imageList[index]['image'],
                        price: price,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
