import 'package:flutter/material.dart';

import '../auth/email_varify.dart';
import '../auth/first_intro.dart';
import '../auth/logIn_Screen.dart';
import '../auth/pin_varify.dart';
import '../auth/set_password.dart';
import '../auth/signUp_screen.dart';
import '../splash_screen/home_screen.dart';


class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/FirstIntro',
      routes: {
        '/': (context) => const HomeScreen(),
        '/FirstIntro': (context) => const FirstIntro(),
        '/LoginScreen': (context) => const LoginScreen(),
        '/SignUpScreen': (context) => const SignUpScreen(),
        '/EmailVarify': (context) => const EmailVarify(),
        '/PinVarify': (context) => const PinVarify(),
        '/SetPassword': (context) => const SetPassword(),
      },
    );
  }
}

