import 'package:flutter/material.dart';

class Registerpag extends StatelessWidget {
  const Registerpag({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numberTEController = TextEditingController();
    TextEditingController emailTEController = TextEditingController();
    TextEditingController passwordTEController = TextEditingController();
    TextEditingController re_passwordTEController = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Enter your mobile number'),
                ),
                SizedBox(height: 10),
                InputTextField(
                  TEController:numberTEController,
                  keyboardType: TextInputType.phone,
                  hinText: '1712345678',
                  suffixIcon: Icon(Icons.check_circle),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Enter your mobile number'),
                ),
                SizedBox(height: 10),
                InputTextField(
                  TEController: emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  hinText: 'abc12@gmail.com',
                  suffixIcon: null,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Enter your password'),
                ),
                SizedBox(height: 10),
                InputTextField(
                  TEController: passwordTEController,
                  keyboardType: TextInputType.visiblePassword,
                  hinText: '********',
                  suffixIcon: Icon(Icons.remove_red_eye),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Re_Enter your password'),
                ),
                SizedBox(height: 10),
                InputTextField(
                  TEController: re_passwordTEController,
                  keyboardType: TextInputType.visiblePassword,
                  hinText: '********',
                  suffixIcon: Icon(Icons.remove_red_eye),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account?',
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
                SizedBox(height: 5),
                Text('or', style: TextStyle(color: Colors.black54)),
                SizedBox(height: 20),
                SizedBox(
                  height: 80,
                  width: double.infinity,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        // Image.asset('assets/IMG.jpg'),
                        Text('Continue with Google'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(children: [Text('Continue with Apple')]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  String hinText;
  final TextInputType keyboardType;
  final TextEditingController TEController;
  final Icon? suffixIcon;
  final obscureText;

  InputTextField({
    super.key,
    required this.TEController,
    required this.keyboardType,
    required this.hinText,
    required this.suffixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: TEController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hinText,
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.black.withAlpha(200),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black26, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }
}
