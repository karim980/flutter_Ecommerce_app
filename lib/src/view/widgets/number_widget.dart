import 'package:firebase_f_test/core/colors/app_color.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  String number;
  String text;

   NumberWidget({
    super.key,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number ,style: TextStyle(color: AppColors.splashColor,fontSize: 24),),
        SizedBox(height: 5,),
        Text(text ,style: TextStyle(fontSize: 18,color: Colors.grey),),
      ],
    );
  }
}
