import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Loading.dart';
import 'Profile.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/ProfilePage': (context) => ProfilePage(),
            '/': (context) => LoadingPage(),
          },
          initialRoute: '/',
        );
      },
      // child: const HomePage(title: 'First Method'),
    );


  }
}