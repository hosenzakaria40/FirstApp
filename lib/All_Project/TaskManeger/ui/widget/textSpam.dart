import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';

class Customtextspam extends StatelessWidget {
  final String firstText;
  final String secondText;
  final TapGestureRecognizer recognizer;

  const Customtextspam({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.recognizer,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: AppColor.primaryText,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: TextStyle(color: AppColor.primaryButton),
            recognizer: recognizer,
          ),
        ],
      ),
    );
  }
}
