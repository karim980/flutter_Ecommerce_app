import 'package:firebase_f_test/src/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';

class MaterialHomeView extends StatelessWidget {
  final List<Widget> pages = [
    HomeScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Obx(
            () => pages[Get.find<HomeController>().selectedIndex.value],
      ),
      bottomNavigationBar: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.changePage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined),
                label: 'fav',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
