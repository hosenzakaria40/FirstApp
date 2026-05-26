import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomWidget'),
          backgroundColor: Colors.blue,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.red,
                      Colors.black,
                      Colors.pink,
                      Colors.amber,
                      Colors.deepPurpleAccent,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.blue,
                      Colors.red,
                      Colors.black,
                      Colors.pink,
                      Colors.amber,
                      Colors.deepPurpleAccent,
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(height: 100, width: 100),
              SizedBox(height: 25),

              Container(

                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 500,

                // child: Image.asset(
                //   'asset/IMG.jpg',
                //   filterQuality: FilterQuality.high,
                //   fit: BoxFit.cover,
                // ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade300,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image:AssetImage('asset/IMG.jpg',)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    ),
                  ]
                  
                ),

                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black.withAlpha(50),
                  // color: Colors.black.withValues(blue: 0.1, green: 0.1, red: 0.1),
                ),
              ),
              Text('data',style: TextStyle(fontSize:50,fontWeight:FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
