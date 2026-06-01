import 'package:flutter/material.dart';

class Responsible extends StatelessWidget {
  const Responsible({super.key});

  @override
  Widget build(BuildContext context) {
    //////method 1
    // Size ScreenSize =MediaQuery.of(context).size;
    // double screenH =ScreenSize.height;
    // double screenW =ScreenSize.width;

    /////ja kno akte kaj korai hoi....

    ////methode 2
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    ///ডিভাইসটি Portrait নাকি Landscape মোডে আছে সেটা জানার জন্য ব্যবহার করা হয়।
    final Orientation orientation = MediaQuery.of(context).orientation;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsible'),
          backgroundColor: Colors.blue,
        ),
        body: orientation == Orientation.portrait
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    orientation.toString(),
                    style: TextStyle(fontSize: screenW * 0.1),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    height: screenH * 0.3,
                    //////////////////////////////////////////////////////////////////////
                    width: screenW * 0.5,
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.blueAccent],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      // color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 4, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: Colors.green,
                          offset: Offset(4, 5),
                        ),
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: Colors.lime,
                          offset: Offset(5, 0),
                        ),
                      ],
                    ),
                    child: Text(
                      'flutter',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '''
                lajkhgpiyrhgpjhgkhagkhskjhdfgkjshdfgh
                s;pfhgs;khfgs[oihrgoieruythdkfhgk;hdgkhg
                sdlkhgskhfgkshgshgisuhgihkjhdfgkhskhgkhgh
                slghkhgkjshgk;dfhgk;jhdghgh s;lkdhgdgkjhskjg 
                lskjhfgkshfkghkshg
                ''',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                  RichText(
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
                ],
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      orientation.toString(),
                      style: TextStyle(fontSize: screenW * 0.1),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      height: screenH * 0.3,
                      width: screenW * 0.5,
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.pink, Colors.blueAccent],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        // color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 4, color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 2,
                            color: Colors.green,
                            offset: Offset(4, 5),
                          ),
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 2,
                            color: Colors.lime,
                            offset: Offset(5, 0),
                          ),
                        ],
                      ),
                      child: Text(
                        'flutter',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '''
                lajkhgpiyrhgpjhgkhagkhskjhdfgkjshdfgh
                s;pfhgs;khfgs[oihrgoieruythdkfhgk;hdgkhg
                sdlkhgskhfgkshgshgisuhgihkjhdfgkhskhgkhgh
                slghkhgkjshgk;dfhgk;jhdghgh s;lkdhgdgkjhskjg 
                lskjhfgkshfkghkshg
                ''',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                    RichText(
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
                  ],
                ),
              ),
      ),
    );
  }
}
