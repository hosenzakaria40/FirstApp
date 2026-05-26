import 'package:flutter/material.dart';

class ListviewD extends StatelessWidget {
  const ListviewD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        ///normal listview
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ListView(
        //
        //     children: [
        //       Card(
        //         child: ListTile(
        //           title: Text('Mr.King'),
        //           subtitle: Text('01914366469'),
        //           leading: Icon(Icons.contact_emergency),
        //           trailing: Icon(Icons.call),
        //         ),
        //       ),
        //       Card(
        //         child: ListTile(
        //           title: Text('Mr.King'),
        //           subtitle: Text('01914366469'),
        //           leading: Icon(Icons.contact_emergency),
        //           trailing: Icon(Icons.call),
        //           // isThreeLine: true,
        //           // dense: true,
        //         ),
        //       ),
        //       Card(
        //         child: ListTile(
        //           title: Text('Mr.King'),
        //           subtitle: Text('01914366469'),
        //           leading: Icon(Icons.contact_emergency),
        //           trailing: Icon(Icons.call),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: ListView.builder(
          // controller: ScrollController(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Mr.King'),
                subtitle: Text('01914366469'),
                leading: Icon(Icons.contact_emergency),
                trailing: Icon(Icons.call),
              ),
            );
          },
        ),

      ),
    );
  }
}
