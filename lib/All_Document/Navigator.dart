import 'package:flutter/material.dart';




class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:.center,children: [
            ElevatedButton(onPressed: (){Navigator.pushNamed(context,  '/AlertBox',);}, child: Text('Navigator.push')),SizedBox(height: 10,),
            ElevatedButton(onPressed: (){Navigator.popAndPushNamed(context, '/ShimmerPackage',);}, child: Text('data')),SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text('data')),SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text('data')),SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text('data')),SizedBox(height: 10,),



        ],),
      ),

    );
  }
}
