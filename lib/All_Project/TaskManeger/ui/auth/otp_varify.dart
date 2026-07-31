import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/bg_screen.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/primary_button.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widget/validator.dart';

class PinVarify extends StatefulWidget {
  const PinVarify({super.key});

  @override
  State<PinVarify> createState() => _PinVarifyState();
}

class _PinVarifyState extends State<PinVarify> {
  TextEditingController pinController = TextEditingController();
  PinInputController pinInputController = PinInputController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Future<void> getToLogin_Screen() async {
    Navigator.pushReplacementNamed(context, '/LoginScreen');
  }

  Future<void> getToSetPassword() async {
    Navigator.pushReplacementNamed(context, '/SetPassword');
  }
  Future<void> getToEmailVarify() async {
    Navigator.pushReplacementNamed(context, '/EmailVarify');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bg_screen(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextDesign(
                    text: 'Pin varification',
                    fontSize: 40,
                    color: AppColor.primaryText,
                    fontWeight: FontWeight.w900,
                  ),
                  CustomTextDesign(
                    text: 'A 4 digit pin has been sent to your email',
                    fontSize: 20,
                    color: AppColor.secondaryText,
                    fontWeight: FontWeight.w600,
                  ),

              PinInput(
                keyboardType: TextInputType.number,
                // key: _formKey,
                pinController:pinInputController,
              length: 4,
              // obscureText: false,

              builder: (context, cells) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: cells.map((cell) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: cell.isFocused ? AppColor.primaryButton : AppColor.secondaryText,
                      ),
                      child: Center(
                        child: Text(
                          cell.character ?? '*',
                          style: TextStyle(fontSize: 24, color:AppColor.primaryIcon,fontWeight: .w900),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              // onCompleted: (pin) => print('PIN: $pin'),
            ),








                  // UserInput(
                  //   controller: pinController,
                  //   hintText: 'Password',
                  //   keyboardType: TextInputType.visiblePassword,
                  //   // isPassword: true,
                  //   // maxLines: 1,
                  //   validator:  Validators.otp,
                  // ),
                  primaryButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate())
                      getToSetPassword();
                    },
                    child: Text('Varify'),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Resend code? ',
                        style: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = getToLogin_Screen,

                            text: 'Sign In',
                            style: TextStyle(
                              color: AppColor.primaryButton,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],

                        recognizer: TapGestureRecognizer()..onTap =getToEmailVarify,
                      ),
                    ),
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
