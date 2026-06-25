import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType keyboardType;

  final String hintText;
  final TextEditingController TEController;
  final IconData? suffixIcons;
  final String? Function(String?)? functionValidator;
  final Color? IconColors;
  final bool? obscureText;

  const InputField({
    super.key,
    required this.TEController,
    required this.keyboardType,
    required this.hintText,
    this.suffixIcons,
    this.IconColors,
    required this.functionValidator,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: TEController,
      obscureText: obscureText ?? false,
      validator: functionValidator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(suffixIcons, color: IconColors),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
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
