import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/primary_button.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/textSpam.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/user_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widget/bg_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future<void>getToLogin_Screen()async{
    Navigator.pushReplacementNamed(context, '/LoginScreen');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bg_screen(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,child: CustomTextDesign(text: 'Join With us', fontSize: 40, color: AppColor.primaryText, fontWeight: FontWeight.w900)),
              UserInput(controller: nameController, hintText: 'Full Name', keyboardType: TextInputType.text),
              UserInput(controller: emailController, hintText: 'Email', keyboardType: TextInputType.emailAddress),
              UserInput(controller: phoneController, hintText: 'Phone Number', keyboardType: TextInputType.phone),
              UserInput(controller: passwordController, hintText: 'Password', keyboardType: TextInputType.visiblePassword),
              UserInput(controller: confirmPasswordController, hintText: 'Confirm Password', keyboardType: TextInputType.visiblePassword),
              primaryButton(onPressed:(){},child: Icon(Icons.arrow_circle_right_outlined, size: 25),),
              Customtextspam(firstText: 'Have Account ?', secondText: 'Sign In', recognizer: TapGestureRecognizer()..onTap =getToLogin_Screen ),
            ],

          ),
        ),
      ),
    );
  }
}
