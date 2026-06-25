import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../StudentProfileCard/Widget/TextDesign.dart';



class BMI_Table extends StatelessWidget {
  const BMI_Table({super.key, required this.row});

  final List<(String, String, Color)> row;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 20.sp, horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDesign(
              text: 'BMI Category',
              fontSize: 20.sp,
              color: Colors.grey[900]!,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),

            ...row
                .map(
                  (e) => Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 20.sp, color: e.$3),
                      SizedBox(width: 15.w),
                      TextDesign(
                        text: e.$1,
                        fontSize: 20.sp,
                        color: Colors.grey[900]!,
                      ),
                      SizedBox(width: 25.w),
                      TextDesign(
                        text: e.$2,
                        fontSize: 20.sp,
                        color: Colors.grey[900]!,
                      ),
                    ],
                  ),
                ],
              ),
            )
                .toList(),
          ],
        ),
      ),
    );
  }
}