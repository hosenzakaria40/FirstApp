import 'package:flutter/material.dart';

class Animatedwidget extends StatefulWidget {
  const Animatedwidget({super.key});

  @override
  State<Animatedwidget> createState() => _AnimatedwidgetState();
}

class _AnimatedwidgetState extends State<Animatedwidget> {
  bool isActive = false;
  bool isActive1 = false;
  bool isActive2 = false;

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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //////Padding
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                  child: Container(
                    color: Colors.red,
                    child: AnimatedPadding(
                      padding: EdgeInsets.all(isActive ? 0 : 30),
                      duration: Duration(seconds: 1),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Text('padding'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ///////Alignment
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActive1 = !isActive1;
                    });
                  },
                  child: AnimatedAlign(
                    alignment: isActive1
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    duration: Duration(seconds: 2),
                    child: Image.asset(
                      'assets/download.png',
                      height: 100,
                      width: 100,
                    ) /*curve: Curves.slowMiddle,,,,,,,ar kaj kiva be solbe  widget ta*/,
                  ),
                ),
                SizedBox(height: 20),
                ///////Transform
                SizedBox(height: 20),
                /////opacity
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActive2 = !isActive2;
                    });
                  },
                  child: AnimatedOpacity(
                    opacity: isActive2 ? 0 : 1,
                    duration: Duration(seconds: 2),
                    child: Text(
                      'data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1500),
                  duration: Duration(seconds: 5),
                  builder: (context, value, child) {
                    return Text(
                      'Taka ${value.toInt()}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 0.6),
                  duration: Duration(seconds: 5),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Image.asset('assets/download.png'),
                    );
                  },
                ),
                SizedBox(height: 20),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 5),
                  builder: (context, value, child) {
                    return LinearProgressIndicator(
                      value: value,
                      minHeight: 20,
                      backgroundColor: Colors.green,
                      // color: Colors.red,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
