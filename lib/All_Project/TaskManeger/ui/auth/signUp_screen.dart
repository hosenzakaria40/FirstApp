import 'dart:math';

import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/data/models/api_response.dart';
import 'package:fast_app/All_Project/TaskManeger/data/service/api_caller.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/primary_button.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/textSpam.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/user_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../util/urls.dart';
import '../widget/bg_screen.dart';
import '../widget/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    final ApiResponse response = await ApiCaller().postRequest(
      url: TMUrls.SignupURL,

      body: {
        'email': _emailController.text,
        'firstname': _nameController.text,
        'lastName': _lastNameController.text,
        'mobile': _phoneController.text,
        'password': _passwordController.text,

      },
    );
    if (response.isSuccess == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.responseData['status']['data'].toString()),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.responseData.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _lastNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bg_screen(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: _formKey,
              child: Column(

                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomTextDesign(
                      text: 'Join With us',
                      fontSize: 40,
                      color: AppColor.primaryText,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  UserInput(
                    controller: _emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  UserInput(
                    controller: _nameController,
                    hintText: 'First Name',
          
                    keyboardType: TextInputType.text,
                    validator: Validators.fullName,
                  ),
                  UserInput(
                    controller: _lastNameController,
                    hintText: 'Last Name',
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.fullName,
                  ),
                  UserInput(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    validator: Validators.phone,
                  ),
                  UserInput(
                    controller: _passwordController,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.password,
                  ),

                  primaryButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUp();
                        Navigator.pushReplacementNamed(context, '/LoginScreen');
                      }
                    },
                    child: Icon(Icons.arrow_circle_right_outlined, size: 25),
                  ),
                  Customtextspam(
                    firstText: 'Have Account ?',
                    secondText: ' Sign In',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () =>
                          Navigator.pushReplacementNamed(context, '/LoginScreen'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
