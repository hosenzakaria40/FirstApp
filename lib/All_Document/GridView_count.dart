import 'package:flutter/material.dart';
/*
akbare create kore sob item
Ate baboher  kore hoi manu dakenor kaj a

 */

class Gridview_Widget extends StatelessWidget {
  const Gridview_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: GridView.count(
            crossAxisCount: 3,
            // scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Card(elevation: 10, child: Container(color: Colors.white)),
              Container(color: Colors.white),
              Container(color: Colors.green),
              Container(color: Colors.white),
              Container(color: Colors.amber, height: 200, width: 200),
              Container(color: Colors.amber, height: 200, width: 200),
            ],
          ),
        ),
      ),
    );
  }
}
