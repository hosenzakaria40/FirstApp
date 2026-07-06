import 'package:flutter/material.dart';

import '../ui/home_screen.dart';


void main()=>runApp(Route_Screen());

class Route_Screen extends StatefulWidget {
  const Route_Screen({super.key});

  @override
  State<Route_Screen> createState() => _Route_ScreenState();
}

class _Route_ScreenState extends State<Route_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home_screen(),
      },
    );
  }
}
