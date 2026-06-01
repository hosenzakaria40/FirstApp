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
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Container(height: 100, width: 100, color: Colors.blue),
                Spacer(),
                Container(height: 100, width: 100, color: Colors.black),
                Spacer(),
                Container(height: 100, width: 100, color: Colors.blue),
                Spacer(),
                // Container(
                //   height: 200,
                //   width: 200,
                //   color: Colors.blue,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
Akena Spaser and MainAxisAlignment Akoi kaj  kore


4. spaceBetween
প্রথম widget একদম শুরুতে,
শেষ widget একদম শেষে,
মাঝখানে equal gap।
[A]------[B]------[C]

5. spaceAround
প্রতিটা widget এর দুই পাশে space থাকে।
কিন্তু edge এ কম space হয়।
--[A]----[B]----[C]--

6. spaceEvenly
সব side এ equal space থাকে।
---[A]---[B]---[C]---


*/
