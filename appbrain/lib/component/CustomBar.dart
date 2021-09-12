import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class CustomBar {
  Future<void> showAlert(
    String title,
    String message, {
    Color color,
  }) =>
      Flushbar(
        backgroundColor: Colors.black,
        barBlur: 10,
        borderRadius: BorderRadius.zero,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.GROUNDED,
        message: message,
        title: title,
      ).show(OneContext().context);
}
