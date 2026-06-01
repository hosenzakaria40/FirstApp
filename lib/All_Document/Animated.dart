import 'package:flutter/material.dart';
class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  final bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(duration: Duration(seconds: 3),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width:isActive? 150: 200,
                height: isActive? 150: 200,
                color: Colors.blue,
                child: Text('data'),
              )
            ],
          ),
      )
      )
    );
  }
}


            /*
        Column(
        children: [
        AnimatedContainer(
        alignment: isRight
          ? Alignment.centerRight
          : Alignment.centerLeft,
          padding: EdgeInsets.all(
            isLarge ? 30 : 10,
          ),
          duration: Duration(seconds: 1),
          width: isBig ? 200 : 100,
          height: isBig ? 200 : 100,
          color: isRed ? Colors.red : Colors.blue,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(
              isRound ? 50 : 0,
            ),
            border: Border.all(
              color: isActive ? Colors.red : Colors.black,
              width: isActive ? 5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: isGlow ? 20 : 5,
              ),
            ],
          ),
          ],
        ),*/

