import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:flutter/material.dart';
class CardWidget extends StatelessWidget {
  final String title;
  final int number;

  const CardWidget({
    super.key,required this.title, required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextDesign(
            text: number.toString(),
            fontSize: 30,
            color: AppColor.primaryText,
            fontWeight: FontWeight.w900,
          ),
          CustomTextDesign(
            text:title,
            fontSize: 18,
            color: AppColor.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
