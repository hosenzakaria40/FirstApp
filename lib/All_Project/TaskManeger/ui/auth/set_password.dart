import 'package:fast_app/All_Project/TaskManeger/ui/widget/bg_screen.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/primary_button.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/textSpam.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/user_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future<void>getToLogin_Screen()async{
    Navigator.pushReplacementNamed(context, '/LoginScreen');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bg_screen(child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextDesign(text: 'Set Password', fontSize: 40, color: Colors.black, fontWeight: FontWeight.w900),
            UserInput(controller: passwordController, hintText: 'Password', keyboardType: TextInputType.visiblePassword,isPassword: true),
            UserInput(controller: confirmPasswordController, hintText: 'Confirm Password', keyboardType: TextInputType.visiblePassword,isPassword: true,),
            primaryButton(onPressed:(){},child: Text('Submit'),),
            Customtextspam(firstText: 'Have Account ?', secondText: 'Sign In', recognizer: TapGestureRecognizer()..onTap =getToLogin_Screen ),

            ]
        ),
      )),
    );
  }
}
