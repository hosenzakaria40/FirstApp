

import 'package:flutter/material.dart';

class Dragdrow extends StatefulWidget {
  const Dragdrow({super.key});

  @override
  State<Dragdrow> createState() => _DragdrowState();
}

class _DragdrowState extends State<Dragdrow> {
  double dx = 0;
  double dy = 0;
  double dx1 = 0;
  double dy1 = 0;
  double dx2 = 0;
  double dy2 = 0;
  double scale=1.0;
  double previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onPanUpdate: (details){
                  setState(() {
                    dx += details.delta.dx;
                    dy += details.delta.dy;
                    // print(dx);
                    // print(dy);
                  });
                  // print(details.delta.dx);
                  // print(details.delta.dy);
                },
                child: Transform.translate(
                  offset: Offset(dx, dy),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                    child: Text('Drag'),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onHorizontalDragUpdate: (details){
                  setState(() {
                    dx1 += details.delta.dx;
                    // dy1 += details.delta.dy;
                    // print(dx);
                    // print(dy);
                  });
                  // print(details.delta.dx);
                  // print(details.delta.dy);
                },
                child: Transform.translate(
                  offset: Offset(dx1, dy1),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                    child: Text('Horizontal Drag'),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onVerticalDragUpdate: (details){
                  setState(() {
                    // dx1 += details.delta.dx;
                    dy2 += details.delta.dy;
                    // print(dx);
                    // print(dy);
                  });
                  // print(details.delta.dx);
                  // print(details.delta.dy);
                },
                child: Transform.translate(
                  offset: Offset(dx2, dy2),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                    child: Text('VerticalDrag'),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              
              SizedBox(height: 20,),
              GestureDetector(
                onScaleUpdate: (details){
                  setState(() {
                    scale += details.scale;
                    print(scale);
                  });
                },
                child: Transform.scale(
                  scale: scale,
                  child: Container(

                    height: 150,
                    width: 150,
                    color: Colors.purpleAccent,

                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                  onScaleUpdate: (details) {
                    setState(() {
                      //////normal  onak bor hoi hoted
                      // scale = previousScale * details.scale;
                      ///zoom value fixt kore dawwa hoi
                      scale = (previousScale * details.scale).clamp(0.5,0.6);
                    });
                  },
                onScaleStart: (details) {
                  previousScale = scale;
                },
                child: Transform.scale(
                  scale: scale,
                  child: Container(

                    height: 150,
                    width: 150,
                    color: Colors.brown,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      )
    );
  }
}
