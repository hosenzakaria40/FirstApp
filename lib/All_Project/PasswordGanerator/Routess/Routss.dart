import 'package:flutter/material.dart';

import '../ui/home_Sc.dart';


void main()=>runApp(Routss());

class Routss extends StatelessWidget {
  const Routss({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeSc(),
      },
    );
  }
}
