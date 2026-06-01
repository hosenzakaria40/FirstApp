import 'package:flutter/material.dart';

class GridviewBuilder extends StatelessWidget {
  const GridviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.builder(
          itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 50,
              mainAxisSpacing: 50,
            ),
            itemBuilder: (context, index) {
              return
                Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Icon(Icons.cabin_outlined),

                );
            }
        ),
      ),
    );
  }
}
