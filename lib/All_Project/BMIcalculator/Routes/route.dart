import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screen/homeScreen.dart';
import '../Screen/introScreen.dart';

void main(){
  runApp(const Route());
}


class Route extends StatelessWidget {
  const Route({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const IntroScreen(),
            '/Homescreen': (context) => const Homescreen(),
          },
          initialRoute: '/',
        );
      },
    );
  }
}
