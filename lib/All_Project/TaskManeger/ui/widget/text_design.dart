import 'package:flutter/cupertino.dart';

class CustomTextDesign extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;

  const CustomTextDesign({super.key,required this.text, required this.fontSize, required this.color, this.fontWeight, });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
