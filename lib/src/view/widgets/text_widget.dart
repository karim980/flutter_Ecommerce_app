import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text;


   TextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var _appTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text, style: _appTheme.headline5),
    );
  }
}
