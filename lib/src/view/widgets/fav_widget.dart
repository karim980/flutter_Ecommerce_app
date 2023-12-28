import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavWidget extends StatelessWidget {
  String image;
  String name;
  String gender;
  String price;

  FavWidget({
    super.key,
    required this.image,
    required this.name,
    required this.gender,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Container(
              height: 170,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fitHeight)),
            ),
            const SizedBox(width: 10,),
            Container(width: 150,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  const SizedBox(height: 8,),
                  Text(gender),
                  const SizedBox(height: 8,),
                  Text(price),
                  const SizedBox(height: 8,),
                  Icon(Icons.favorite,color: Colors.red,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
