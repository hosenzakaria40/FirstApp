import 'package:flutter/material.dart';

class ContainerDesign extends StatelessWidget {
  const ContainerDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10,
                      offset: Offset(4, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(radius: 50, backgroundColor: Colors.blue),
                    Column(
                      children: [
                        Text('sdgkg;sdkg'),
                        Text('sdgkg;sdkg'),
                        Text('sdgkg;sdkg'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,


                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.black, width: 5,),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red,
                          blurRadius: 10,
                          offset: Offset(5, 6)
                      )
                    ]
                ),
                height: 150,
                width: 150,

                child: Text(' aliusyhf'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
