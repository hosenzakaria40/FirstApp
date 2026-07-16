import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/bg_screen.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/primary_button.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/user_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PinVarify extends StatefulWidget {
  const PinVarify({super.key});

  @override
  State<PinVarify> createState() => _PinVarifyState();
}

class _PinVarifyState extends State<PinVarify> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future<void>getToLogin_Screen()async{
    Navigator.pushReplacementNamed(context, '/LoginScreen');
  }
  Future<void>getToSetPassword()async{
    Navigator.pushReplacementNamed(context, '/SetPassword');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bg_screen(child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextDesign(text: 'Pin varification', fontSize: 40, color: AppColor.primaryText, fontWeight: FontWeight.w900),
            CustomTextDesign(text: 'A 4 digit pin has been sent to your email', fontSize: 20, color: AppColor.secondaryText, fontWeight: FontWeight.w600),

            UserInput(controller: passwordController, hintText: 'Password', keyboardType: TextInputType.visiblePassword,isPassword: true),
            primaryButton(onPressed:(){getToSetPassword();},child: Text('Varify'),),
            Align(

              alignment: Alignment.center,
              child: RichText(text: TextSpan(
                text: 'Resend code? ',
                style: TextStyle(color: AppColor.secondaryText, fontSize: 20, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()..onTap =getToLogin_Screen,

                      text: 'Sign In', style: TextStyle(color: AppColor.primaryButton, fontSize: 20, fontWeight: FontWeight.w500,)),

                ],
                // recognizer: TapGestureRecognizer()..onTap =getToLogin_Screen,

              )),
            )


            ]
        ),
      )),
    );
  }
}
