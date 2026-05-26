import 'package:flutter/material.dart';

class FirstDesign extends StatelessWidget {
  const FirstDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirstDesign',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              // alignment: Alignment.center,
              // textDirection: TextDirection.ltr,
              // overflow: Overflow.visible,
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/300/300',
                            ),
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications_none),
                            style: IconButton.styleFrom(
                              iconSize: 40,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Hi, programmer',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Your Health is Our\nFirst Priority',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -15,
                  left: 15,
                  right: 15,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      hintText: 'Search here...',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black38,
                        size: 30,
                      ),
                      prefixStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: IconButton.filled(
                  onPressed: (){},
                  icon: Icon(Icons.favorite),
                  iconSize: 50,
                color: Colors.white,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
