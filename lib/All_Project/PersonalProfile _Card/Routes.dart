import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'MainScreen.dart';

void main() {
  runApp(ThisApp());
}

class ThisApp extends StatelessWidget {
  const ThisApp({super.key});

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
            '/': (context) => Mainscreen()

          },
          initialRoute: '/',
        );
      },
    );
  }
}
