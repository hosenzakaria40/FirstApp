import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/bg_screen.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/textSpam.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../data/auth_controller/auth_controller.dart';
import '../../data/models/api_response.dart';
import '../../data/models/user_model.dart';
import '../../data/service/api_caller.dart';
import '../../util/urls.dart';
import '../widget/primary_button.dart';
import '../widget/user_input.dart';
import '../widget/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /*
  ApiCaller apiCaller=ApiCaller();
  List<dynamic>product=[];

  Future<void>fatchData()async{
    await apiCaller.getRequest(url: TMUrls.SignupURL);
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    fatchData();

  }

  Future<void >showProduct()async{
    await apiCaller.getRequest(url: TMUrls.SignupURL);
    TaskModelManeger taskModelManeger=TaskModelManeger.fromJson(product as Map<String, dynamic>);
    fatchData();
  }
*/

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  Future<void> getToSignUp_Screen() async {
    Navigator.pushReplacementNamed(context, '/SignUpScreen');
  }

  Future<void> logIn() async {
    final ApiResponse response = await ApiCaller().postRequest(
      url: TMUrls.LoginURL,

      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );
    if (response.isSuccess == true) {
      UserModel userModel = UserModel.fromJson(response.responseData['data']);
      String token = response.responseData['token'];
      AuthController.saveUserData(userModel, token);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "logIn Success...!",
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, '/');
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
  Widget build(BuildContext context){
    return Scaffold(
      body: bg_screen(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: _formKey,
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
                    controller: _emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  UserInput(
                    controller: _passwordController,
                    hintText: 'password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.password,
                  ),
                  primaryButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        logIn();
                      }
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
      ),
    );
  }
}
