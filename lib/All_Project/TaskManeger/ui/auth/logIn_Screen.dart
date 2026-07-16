import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/bg_screen.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/textSpam.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widget/primary_button.dart';
import '../widget/user_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> getToSignUp_Screen() async {
    Navigator.pushReplacementNamed(context, '/SignUpScreen');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bg_screen(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                CustomTextDesign(
                  text: 'Get Started With ',
                  fontSize: 40,
                  color: AppColor.primaryText,
                  fontWeight: .w900,
                ),
                UserInput(
                  controller: emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                UserInput(
                  controller: passwordController,
                  hintText: 'password',
                  keyboardType: TextInputType.visiblePassword,
                ),

                primaryButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Icon(Icons.arrow_circle_right_outlined, size: 25),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/EmailVarify');
                  },
                  child: CustomTextDesign(
                    text: 'Forget password',
                    fontSize: 20,
                    color: AppColor.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Customtextspam(
                  firstText: 'Don\'t have an account ?',
                  secondText: ' Sign Up',
                  recognizer: TapGestureRecognizer()
                    ..onTap = getToSignUp_Screen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
