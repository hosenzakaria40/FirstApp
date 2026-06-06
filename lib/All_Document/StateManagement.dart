import 'package:flutter/material.dart';

class Statemanagement extends StatefulWidget {

  Statemanagement({super.key}){
    print('statemanagement  1');
  }

  @override
  State<Statemanagement> createState(){
    return _StatemanagementState();
  }
}

class _StatemanagementState extends State<Statemanagement> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('statemanagement  3');
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void didUpdateWidget(covariant Statemanagement oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('statemanagement  4');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

      )
    );
  }
}
