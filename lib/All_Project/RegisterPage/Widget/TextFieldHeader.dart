import 'package:flutter/material.dart';

class TextFieldHeader extends StatelessWidget {
  final String TFHeader;

  const TextFieldHeader({super.key, required this.TFHeader});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(TFHeader, style: TextStyle(color: Colors.black54)),
    );
  }
}
