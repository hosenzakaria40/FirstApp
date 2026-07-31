import 'package:flutter/material.dart';

SnackBarMeassage( BuildContext context, {required String message}) {
  ScaffoldMessenger.of( context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ),
  );
}
SnackBarMeassageError( BuildContext context, {required String message}) {
  ScaffoldMessenger.of( context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}