import 'package:flutter/material.dart';
import 'Widget/CustomButton.dart';
import 'Widget/InputField.dart';
import 'Widget/TextFieldHeader.dart';

class Module12 extends StatelessWidget {
  Module12({super.key});

  final TextEditingController phoneTEController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController rePasswordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 50, right: 50),
                child: Column(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFieldHeader(TFHeader: 'Enter your mobile number'),
                    SizedBox(height: 10),
                    InputField(
                      TEController: phoneTEController,
                      keyboardType: TextInputType.number,
                      hintText: '1712345678',
                      suffixIcons: Icons.check_circle,
                      IconColors: Colors.black87,
                      functionValidator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Enter your mobile number';
                        } else if (value.length != 11) {
                          return 'Enter validate mobile number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFieldHeader(TFHeader: 'Enter your email'),
                    SizedBox(height: 10),
                    InputField(
                      TEController: emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'abc12@gmail.com',
                      functionValidator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Enter your email';
                        } else if (!value.contains('@')) {
                          return 'Enter validate email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFieldHeader(TFHeader: 'Enter your password'),
                    SizedBox(height: 10),
                    InputField(
                      TEController: passwordTEController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: '**************',
                      obscureText: true,
                      suffixIcons: Icons.remove_red_eye,
                      IconColors: Colors.black38,
                      functionValidator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Enter your password';
                        } else if (value.length < 8) {
                          return 'Enter validate password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFieldHeader(TFHeader: 'Re_Enter your password'),
                    SizedBox(height: 10),
                    InputField(
                      TEController: rePasswordTEController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: '**************',
                      suffixIcons: Icons.remove_red_eye,
                      obscureText: true,
                      IconColors: Colors.black38,
                      functionValidator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Re_Enter your password';
                        } else if (value != passwordTEController.text) {
                          return 'Passwords do not match';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      // height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white70,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          print(phoneTEController.text);
                          print(emailTEController.text);
                          print(passwordTEController.text);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'or',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      ButtonText: 'Continue with Google',
                      ButtonLogu: 'assets/google-logo-icon.png',
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      ButtonText: 'Continue with Apple',
                      ButtonLogu: 'assets/Apple.png',
                    ),
                    SizedBox(height: 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
