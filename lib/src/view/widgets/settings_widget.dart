import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  IconData icon;
  String text;
  void Function()? onPress;

  SettingsWidget({super.key, required this.icon,required this.text ,this.onPress});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        color: Colors.grey[100],
        child: MaterialButton(
          onPressed: onPress,
          child: Row(
            children: [
              Icon(icon,color: Colors.black,),
              const SizedBox(width: 20,),
              Text(text,style: TextStyle(fontSize: 20,color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}
