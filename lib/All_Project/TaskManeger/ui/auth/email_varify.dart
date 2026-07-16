import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/bg_screen.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/primary_button.dart'
    show primaryButton;
import 'package:fast_app/All_Project/TaskManeger/ui/widget/textSpam.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart'
    show CustomTextDesign;
import 'package:fast_app/All_Project/TaskManeger/ui/widget/user_input.dart'
    show UserInput;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EmailVarify extends StatefulWidget {
  const EmailVarify({super.key});

  @override
  State<EmailVarify> createState() => _EmailVarifyState();
}

class _EmailVarifyState extends State<EmailVarify> {
  TextEditingController emailController = TextEditingController();

  Future<void> getToPinVarify() async {
    Navigator.pushReplacementNamed(context, '/PinVarify');
  }
  Future<void> LoginScreen() async {
    Navigator.pushReplacementNamed(context, '/LoginScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bg_screen(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Center(
            child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextDesign(
                    text: 'Your Email Address',
                    fontSize: 40,
                    color: AppColor.primaryText,
                    fontWeight: FontWeight.w900,
                  ),
                  CustomTextDesign(
                    text: 'Enter Your Email Address To Continue',
                    fontSize: 20,
                    color:AppColor.secondaryText,
                    fontWeight: FontWeight.w600,
                  ),
                  UserInput(
                    controller: emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  ),
                  primaryButton(
                    onPressed: (){
                      getToPinVarify();
                    },
                    child: Icon(Icons.arrow_circle_right_outlined, size: 25),
                  ),
                  Customtextspam(firstText: 'Have Account ?',
                    secondText: ' Sign In',
                    recognizer:TapGestureRecognizer()
                      ..onTap =LoginScreen,
                  )
                ],

            ),
          ),
        ),
      ),
    );
  }
}
