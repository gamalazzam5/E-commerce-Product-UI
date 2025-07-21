import 'package:flutter/material.dart';

import '../constants/font_const.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.color});
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
       text,
      style: TextStyle(
        fontFamily: primaryFont,
        color: color,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
