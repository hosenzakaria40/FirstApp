import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../StudentProfileCard/Widget/TextDesign.dart';

class IconText extends StatelessWidget {
  final IconData icon;

  final String text;

  const IconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15.sp, color: Colors.grey[900]!),
        SizedBox(width: 5.w),
        TextDesign(text: text, fontSize: 10.sp, color: Colors.grey[800]!),
      ],
    );
  }
}
