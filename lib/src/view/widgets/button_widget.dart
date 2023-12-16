import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  void Function()? onPress;
  String text;
  Color colors;

  ButtonWidget({
    super.key,
    required this.onPress,
    required this.text,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30))),
          elevation: MaterialStatePropertyAll(5),
          backgroundColor: MaterialStatePropertyAll(colors)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: media.width * 0.2, vertical: 20),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
