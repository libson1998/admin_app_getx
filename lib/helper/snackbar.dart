import 'package:flutter/material.dart';

mixin snackBarUtil {
  static SnackBar snackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }
}

