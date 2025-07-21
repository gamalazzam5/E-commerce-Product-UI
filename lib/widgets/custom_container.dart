import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.onPressed, required this.icon});
 final VoidCallback onPressed;
 final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: onPressed
        ,
        icon:icon,color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: Color(0xffff0000),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 40,
      width: 40,
    );
  }
}
