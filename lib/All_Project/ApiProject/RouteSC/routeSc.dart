import 'package:flutter/material.dart';

import '../ui/sereen.dart';

void main()=>runApp(RouteSc());

class RouteSc extends StatelessWidget {
  const RouteSc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Sereen(),
      },
    );
  }
}

