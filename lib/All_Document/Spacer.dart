import 'package:fast_app/All_Project/Module12Assignment/Widget/TextFieldHeader.dart';
import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Spacer(flex: 1),
                Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),

                Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Spacer(flex: 2
                ),
                Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),

                Text(
                  'Hello',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
   Expanded(
                  child: Container(padding: EdgeInsets.all(10),color: Colors.red,height: 100,width: 600,),
                ),

                Expanded(
                  child: Container(padding: EdgeInsets.all(10),color: Colors.blue,height: 100,width: 600,),
                ),
                Expanded(
                  child: Container(padding: EdgeInsets.all(10),color: Colors.deepOrangeAccent,height: 100,width: 600,),
                ),
 */