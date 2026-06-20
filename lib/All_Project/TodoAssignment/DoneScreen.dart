import 'package:flutter/material.dart';

class Donescreen extends StatefulWidget {
  const Donescreen({super.key});

  @override
  State<Donescreen> createState() => _DonescreenState();
}

class _DonescreenState extends State<Donescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container
        (
        color: Colors.green,
        child: Center(
          child: Text(
            'Create',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),

    );
  }
}
