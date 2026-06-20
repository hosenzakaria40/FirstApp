import 'package:fast_app/All_Project/StudentProfileCard/Widget/TextDesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CustomCard.dart';
import 'IconText.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.w,
                        backgroundImage: AssetImage('assets/IMG.jpg'),
                      ),
                      SizedBox(height: 10.h),
                      TextDesign(
                        text: 'John Doe',
                        fontSize: 25,
                        color: Colors.grey[800]!,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5.h),
                      TextDesign(
                        text: 'Flutter Developer',
                        fontSize: 15,
                        color: Colors.grey[700]!,
                      ),
                      SizedBox(height: 10.h),
                      TextDesign(
                        text:
                            'Passionate about creating user-friendly and engaging digital experiences.',
                        fontSize: 10.sp,
                        color: Colors.grey[800]!,
                      ),
                      SizedBox(height: 5.h),
                      Divider(color: Colors.grey[300], thickness: 1.w),
                      SizedBox(height: 5.h),
                      IconText(icon: Icons.mail, text: 'john.doe@example.com'),
                      SizedBox(height: 5.h),
                      IconText(icon: Icons.phone, text: '+123 456 7890'),
                        SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100.w,
                            height: 25.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 2.sp),
                                backgroundColor: Colors.indigo[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.sp),
                                ),
                                foregroundColor: Colors.white,
                                textStyle: TextStyle(fontSize: 10.sp)
              
                              ),
                              onPressed: () {},
                              child: Text('Follow'),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            width: 100.w,
                            height: 25.h,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 2.sp),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.grey[900],
                                textStyle: TextStyle(fontSize: 10.sp),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.sp),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('Message'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[500],
                      thickness: 1.w,
                      indent: 25.w,
                      endIndent: 3.w,
                    ),
                  ),
                  TextDesign(
                    text: 'Interests',
                    fontSize: 20.sp,
                    color: Colors.grey[800]!,
                    fontWeight: FontWeight.bold,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[500],
                      thickness: 1.w,
                      indent: 3.w,
                      endIndent: 25.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  CustomCard(
                    assetsImage: 'assets/IMG.jpg',
                    title: 'Travel',
                    subTitle: 'Exploring new places and around the world',
                  ),
                  CustomCard(
                    assetsImage: 'assets/IMG.jpg',
                    title: 'Photography',
                    subTitle: 'Capturing moments though the lens',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
