import 'package:flutter/material.dart';

import '../TodoAssignment/CreateScreen.dart';
import '../TodoAssignment/DoneScreen.dart';
import '../TodoAssignment/TodoScreen.dart';


class Homepagetodo extends StatefulWidget {
  const Homepagetodo({super.key});

  @override
  State<Homepagetodo> createState() => _HomepagetodoState();
}

class _HomepagetodoState extends State<Homepagetodo> {

  int _currentIndex = 0;
  List<Widget> screen=[
    Todoscreen(),
    Createscreen(),
    Donescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taski'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //
      //   BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Todo',backgroundColor: Colors.red),
      //   BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Create'),
      //   BottomNavigationBarItem(icon: Icon(Icons.check_box_outlined), label: 'Done'),
      // ],
      // selectedItemColor: Colors.blue.shade400,
      //   currentIndex: _currentIndex,
      //   onTap: (index){
      //   setState(() {
      //     _currentIndex = index;
      //   });
      //   },
      // ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            _currentIndex = index;
            setState(() {
            });
          },
          backgroundColor: Colors.grey,
          elevation: 1,
          // height: 50,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(milliseconds: 200),

          labelPadding: EdgeInsetsGeometry.all(1),



          // animationBehavior: NavigationDestinationLabelBehavior.alwaysHide,

          destinations: [
            NavigationDestination(icon: Icon(Icons.calendar_today_outlined), label: 'Todo',),
            NavigationDestination(icon: Icon(Icons.add_box_outlined), label: 'Create'),
            NavigationDestination(icon: Icon(Icons.check_box_outlined), label: 'Done'),
          ]),
      body: screen[_currentIndex],
    );
  }
}
