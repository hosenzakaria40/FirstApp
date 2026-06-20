import 'package:fast_app/All_Project/Navigator/About.dart';
import 'package:flutter/material.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          backgroundColor: Colors.red[500],
        ),
        body: Center(
          child: Column(
            children: [

              SelectableText(
                'Home page',
                selectionColor: Colors.pink[700],
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              // ElevatedButton(onPressed: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));
              // }, child: Text('About Page')),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){

              }, child: Text('Profile Page')),



            ],
          ),
        ),
    );
  }
}

