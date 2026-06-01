import 'package:flutter/material.dart';

import 'home.dart';

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apps',
      theme: ThemeData(primaryColor: Colors.lightBlue),
      darkTheme: ThemeData.dark(),
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeData.,



      home: HomePag(),
    );
  }
}