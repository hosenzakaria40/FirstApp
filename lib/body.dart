import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 80,
      width: double.infinity,
      color: Colors.amber,
      child: Text('data' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
    );
  }
}
