import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  TextEditingController controller;
  void Function(String) onChanged;
  String hintText;

  RoundedTextField({Key? key,
    required this.controller,
    required this.onChanged,
    this.hintText = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        border: Theme.of(context).inputDecorationTheme.border,
        filled: Theme.of(context).inputDecorationTheme.filled,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
      ),
    );
  }
}
