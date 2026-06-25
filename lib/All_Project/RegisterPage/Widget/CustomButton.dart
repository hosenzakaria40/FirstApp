import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String ButtonText, ButtonLogu;

  const CustomButton({
    super.key,
    required this.ButtonText,
    required this.ButtonLogu,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(20),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 20, backgroundImage: AssetImage(ButtonLogu)),
          SizedBox(width: 10),
          Text(
            ButtonText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
