import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:flutter/material.dart';
class primaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const primaryButton({
    super.key, required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryButton,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

          ),
          onPressed: onPressed, child: child),
    );
  }
}