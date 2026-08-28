import 'package:fast_app/All_Project/Use_providerApp/controller/provider_controller.dart';
import 'package:fast_app/All_Project/Use_providerApp/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider())

      ],
      child: MaterialApp(
        title: 'Glass Todo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const Home_ScreenTask(),
      ),
    );
  }
}