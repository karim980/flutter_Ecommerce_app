import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  String title;
  String img;
  String price;

  ItemWidget({
    super.key,
    required this.title,
    required this.img,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        height: 350,
        width: 400,
        child: Column(
          children: [
            Image(
              image: AssetImage(img),
              height: 230,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 16,),
                  Text(title),
                  SizedBox(height: 7,),
                  Text(price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
