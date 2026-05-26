import 'package:flutter/material.dart';

class ListviewSeparetd extends StatelessWidget {
  const ListviewSeparetd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('Jakaria'),
                  subtitle: Text('Eng.BSC Dhaka'),
                  leading: CircleAvatar(radius: 20,
                    backgroundColor: Colors.blue,
                    // backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png'),
                    child: Icon(Icons.person, color: Colors.white,),),
                  trailing: Icon(Icons.delete_forever),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.red, thickness: 2, endIndent: 50, indent: 50,);
            },
          ),
        ),
      ),
    );
  }
}
