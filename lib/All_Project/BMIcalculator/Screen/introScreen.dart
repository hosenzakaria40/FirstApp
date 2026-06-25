



import 'package:fast_app/All_Project/BMIcalculator/Core/ColorTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../StudentProfileCard/Widget/TextDesign.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds:3));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scaleAnimation = Tween<double>(begin: 0.8,end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/Homescreen');
    });
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();

  }






@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: ColorTheme.indigoColor,
    body: Center(child: FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CircleAvatar(
                backgroundColor: Colors.indigoAccent[200],
                radius: 50.w,
                child: Icon(Icons.monitor_weight_outlined,size: 50.sp,color: Colors.white,)),
            SizedBox(height:10.h,),
            TextDesign(text: 'BMI Calculator',fontSize: 40.sp,color:  ColorTheme.whiteColor,fontWeight: FontWeight.bold),
            SizedBox(height: 5.h,),
            TextDesign(text: 'Know your body, know yourself', fontSize: 15.sp, color: ColorTheme.whiteColor),
            SizedBox(height: 15.h,),
            CircularProgressIndicator(color: ColorTheme.whiteColor,)
          ],
        ),
      ),
    ),),

  );
}
}
