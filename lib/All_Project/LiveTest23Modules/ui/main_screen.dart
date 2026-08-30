import 'package:fast_app/All_Project/LiveTest23Modules/controller23/provider_controller.dart';
import 'package:fast_app/All_Project/LiveTest23Modules/ui/addTask.dart';
import 'package:fast_app/All_Project/LiveTest23Modules/ui/home_screen23.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(App23());
}

class App23 extends StatelessWidget {
  const App23({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => TaskProvider23())

    ],
    child: MaterialApp(
      title: "App 23",

      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen23(),
        '/AddTaskButton': (context) => const AddTaskButton23(),



      },
    ),);
  }
}


