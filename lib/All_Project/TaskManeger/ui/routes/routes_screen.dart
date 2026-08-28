import 'package:fast_app/All_Project/TaskManeger/data/provider/Task_provider.dart';
import 'package:fast_app/All_Project/TaskManeger/data/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/email_varify.dart';
import '../auth/first_intro.dart';
import '../auth/logIn_Screen.dart';
import '../auth/otp_varify.dart';
import '../auth/set_password.dart';
import '../auth/signUp_screen.dart';
import '../home_screen/addTask_button.dart';
import '../home_screen/home_screen.dart';
import '../home_screen/newTask_screen.dart';
import '../home_screen/update_profile.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(///ake depandanci injeaktion bole
      providers: [
        ///////protiti change ar jonno akti kore provider use korte hobe /////
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        // ChangeNotifierProvider(create: (_) => TaskModelManager()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/HomeScreen': (context) => const HomeScreen(),
          '/': (context) => const FirstIntro(),
          '/LoginScreen': (context) => const LoginScreen(),
          '/SignUpScreen': (context) => const SignUpScreen(),
          '/EmailVarify': (context) => const EmailVarify(),
          '/PinVarify': (context) => const PinVarify(),
          '/SetPassword': (context) => const SetPassword(),
          '/AddTaskButton': (context) => const AddTaskButton(),
          '/UpdateProfile': (context) => const UpdateProfile(),
        },
      ),
    );
  }
}
