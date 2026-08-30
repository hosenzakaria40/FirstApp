import 'package:flutter/material.dart';

class GlassStyles {
  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x93FFFFFF),
      Color(0x1AFFFFFF),
    ],
  );

  static const LinearGradient glassBorderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x9DFFFFFF),
      Color(0x4AFFFFFF),
    ],
  );
}