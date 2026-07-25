import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final String? labelText;
  final int? maxLines;


  const UserInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
    this.isPassword = false,
    this.prefixIcon,
    this.labelText,
    this.maxLines,

  });

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      style: TextStyle(color: AppColor.primaryText),
      validator:widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: AppColor.secondaryText,fontWeight: FontWeight.bold),
        filled: true,
        fillColor: AppColor.fillColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.focusedBorder),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.focusedErrorBorder),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.focusedErrorBorder),
        ),
        hintStyle: TextStyle(color: AppColor.secondaryText),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: AppColor.primaryIcon)

            : null,

        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
    );
  }
}
