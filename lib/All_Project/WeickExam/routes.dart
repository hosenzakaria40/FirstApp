import 'package:flutter/material.dart';

import 'home.dart';

void main(){
  runApp(const RoutesScreen());
}


class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen01(),
      },
      initialRoute: '/',
    );
  }
}
