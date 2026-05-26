import 'package:flutter/material.dart';

class Richtext_TextSpam extends StatelessWidget {
  const Richtext_TextSpam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RichText(
          text: TextSpan(
            text: 'Hello',
            style: TextStyle(fontSize: 20, color: Colors.black),
            children: [
              TextSpan(
                text: 'Der Friend',
                style: TextStyle(fontSize: 30, color: Colors.pink),
              ),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
