import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/TextDesign.dart';


void showMySnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:Row(children: [
        TextDesign(text: 'Mark Rack marked as Present', fontSize: 10.sp, color: Colors.white),
        SizedBox(width: 10.w),
        Icon(Icons.check_box, size: 15.sp,color: Colors.green[900],),

      ],),
      duration: Duration(seconds: 2),
    ),
  );
}