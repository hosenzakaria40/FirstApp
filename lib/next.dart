import 'package:flutter/material.dart';
void main (){
  runApp(firstApp())
}

class firstrApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
      backgroundColor:Colors.blueAccent,
        body:
        AppBar(
          actions: [
            Tab(
              text: 'king',
              height: 20,

            )
          ],
        ),
      ),
    );
  }
}
