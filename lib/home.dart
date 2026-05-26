import 'package:flutter/material.dart';

import 'body.dart';

class HomePag extends StatelessWidget {
  const HomePag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      appBar: AppBar(
        title: Text('data'),
        backgroundColor: Colors.blue,
        // backgroundColor: Colors.blue.shade100,
        // backgroundColor: Colors.blue.withOpacity(0.5),//0-1 value only
        elevation: 100,
        toolbarOpacity: 0.9,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        // titleSpacing:0,
        centerTitle: true,
        toolbarHeight: 100,
        actions: [
          ElevatedButton(onPressed: () {}, child: Icon(Icons.favorite)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),



      body: Body(),
    );
  }
}
