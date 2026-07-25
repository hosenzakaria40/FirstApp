import 'package:fast_app/All_Project/TaskManeger/ui/widget/bg_screen.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:flutter/material.dart';
import '../../data/auth_controller/auth_controller.dart';
import '../../util/assets_path.dart';

class FirstIntro extends StatefulWidget {
  const FirstIntro({super.key});

  @override
  State<FirstIntro> createState() => _FirstIntroState();
}

class _FirstIntroState extends State<FirstIntro> {
  Future<void> getToLogin_Screen() async {
    await Future.delayed(Duration(seconds: 3));
    AuthController.getUserData();
    bool isLogin = await AuthController.isUserLogin();
    //////
    /*
    if(isLogin==true){
      Navigator.pushReplacementNamed(context, '/');
    }
    else{
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    }
    */
    Navigator.pushReplacementNamed(context, isLogin ? '/' : '/LoginScreen');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToLogin_Screen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bg_screen(
        child: Center(
          child: Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsPath.logoPath3, height: 300, width: 300),
              CustomTextDesign(
                text: 'Welcome to LPG',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
