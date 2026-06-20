import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InfoText extends StatelessWidget {
  final String title;
  final String value;

  const InfoText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title ,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900]!,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: Colors.grey[800]!, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}