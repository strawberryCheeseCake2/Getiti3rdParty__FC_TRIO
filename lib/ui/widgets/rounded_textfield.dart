import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  TextEditingController controller;
  void Function(String) onChanged;
  String hintText;
  int minLines;
  int maxLines;


  RoundedTextField({Key? key,
    required this.controller,
    required this.onChanged,
    this.hintText = '',
    this.minLines = 1,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        border: Theme.of(context).inputDecorationTheme.border,
        filled: Theme.of(context).inputDecorationTheme.filled,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
      ),
    );
  }
}
