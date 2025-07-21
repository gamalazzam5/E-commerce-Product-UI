import 'package:flutter/material.dart';

import '../constants/font_const.dart';

class CustomRichtext extends StatelessWidget {
  const CustomRichtext({super.key, required this.firstText, required this.secondText});
   final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: primaryFont,
            fontSize: 16,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: '$firstText: ',
              style: TextStyle(fontSize: 20),
            ),
            TextSpan(
              text: secondText,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
