import 'dart:math';

import 'package:fast_app/All_Project/StudentProfileCard/Widget/TextDesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeSc extends StatefulWidget {
  const HomeSc({super.key});

  @override
  State<HomeSc> createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {
  String password = '';

  void generatePassword() {
    int? length = int.tryParse(_passwordLengthController.text);

    if (length == null || length < 5 || length > 15) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password length must be between 5 and 15'),
        ),
      );
      return;
    }

    const chars ='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()';

    Random random = Random();

    password = String.fromCharCodes(
      Iterable.generate(
        length,
            (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );

    setState(() {});
  }
  final TextEditingController _passwordLengthController = TextEditingController();
  @override
  void dispose() {
    _passwordLengthController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller:_passwordLengthController ,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'min 5 & max 15',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Password length',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),

                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),alignment: Alignment.center,
                child: ListTile(
                  title:TextDesign(
                    text: password.isEmpty ? 'Password...!' : password,
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,

                  ) ,trailing: IconButton(onPressed: () {
                  if (password.isNotEmpty) {
                    Clipboard.setData(ClipboardData(text: password));

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password Copied'),
                      ),
                    );
                  }
                }, icon: Icon(Icons.copy)),),
                ),



              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: 15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {generatePassword();},
                child: TextDesign(
                  text: 'Create',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
