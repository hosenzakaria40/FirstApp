import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../StudentProfileCard/Widget/TextDesign.dart';

class CustomCard extends StatelessWidget {
  final String assetsImage, title, subTitle;

  const CustomCard({
    super.key,
    required this.assetsImage,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assetsImage),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
              SizedBox(height: 10.h),
              TextDesign(
                text: title,
                fontSize: 10.sp,
                color: Colors.grey[800]!,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 2.h),
              TextDesign(
                text: subTitle,
                fontSize: 7.sp,
                color: Colors.grey[800]!,
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: double.infinity,
                height: 20.h,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 2.sp),
                    backgroundColor: Colors.blueGrey[50]!,
                    foregroundColor: Colors.indigo[600],
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('View More'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
