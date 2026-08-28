import 'package:flutter/material.dart';

class GlassStyles {
  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x66FFFFFF),
      Color(0x1AFFFFFF),
    ],
  );

  static const LinearGradient glassBorderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x3CFFFFFF),
      Color(0x4AFFFFFF),
    ],
  );
}