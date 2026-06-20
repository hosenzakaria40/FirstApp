import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
          style: IconButton.styleFrom(
              overlayColor: Colors.red,
              hoverColor: Colors.purpleAccent,
              backgroundColor: Colors.blue[500]),
        ),
        title: Text('About'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'back',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
