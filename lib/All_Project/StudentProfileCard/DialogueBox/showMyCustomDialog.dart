import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/InfoText.dart';
import '../Widget/TextDesign.dart';



void showMyCustomDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          Icon(Icons.school, size: 30.sp, color: Colors.indigo[900]!),
          SizedBox(width: 10.w),
          TextDesign(
            text: 'Student Details',
            fontSize: 20.sp,
            color: Colors.grey[800]!,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.person, size: 20.sp, color: Colors.indigo[900]!),
              SizedBox(width: 8.w),
              InfoText(title: 'Name:', value: 'Mike Rack'),
            ],
          ),
          SizedBox(height: 10.h),

          Row(
            children: [
              Icon(Icons.badge, size: 20.sp, color: Colors.indigo[900]!),
              SizedBox(width: 8.w),
              InfoText(title: 'ID:', value: 'STU-2025-0042'),
            ],
          ),

          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.apartment, size: 20.sp, color: Colors.indigo[900]!),
              SizedBox(width: 8.w),
              Expanded(
                child: InfoText(
                  title: 'Dept:',
                  value: 'Computer Science & Engineering',
                ),
              ),
            ],
          ),
        ],
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: TextDesign(
            text: 'Close',
            fontSize: 15.sp,
            color: Colors.indigo[700]!,
          ),
        ),
      ],
    ),
  );
}