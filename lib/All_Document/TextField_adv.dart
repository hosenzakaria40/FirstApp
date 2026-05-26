import 'package:flutter/material.dart';

class TextfieldAdv extends StatelessWidget {
  final String labelText='Email' ;
  const TextfieldAdv({super.key, });

  @override
  Widget build(BuildContext context) {
    TextEditingController? emailController = TextEditingController();
    TextEditingController? passWordController = TextEditingController();
    Size ScreenSize = MediaQuery.of(context).size;
    double screenH = ScreenSize.height;
    double screenW = ScreenSize.width;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return MaterialApp(
      title: 'Login pag',

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login pag'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login Now..... !',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: .bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: labelText,
                    hintText: 'Enter your Email',
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.blue,
                    // errorText: 'Enter validate your Email',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(color: Colors.black, width: 2),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passWordController,
                  obscureText: true,
                  maxLength: 8,
                  // maxLines: 5,
                  // controller: controller,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.blue,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    suffixIconColor: Colors.black.withAlpha(0),
                    // prefixStyle: TextStyle(color: Colors.red),
                    // errorText: 'Enter validate your Password',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   borderSide: BorderSide(color: Colors.black, width: 2),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  width: screenW,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      enabledMouseCursor: MouseCursor.defer,
                    ),

                    onPressed: () {
                      print(emailController.text);
                      print(passWordController.text);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: .bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
