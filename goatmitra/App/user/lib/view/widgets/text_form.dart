import 'package:flutter/material.dart';

class Textfieldinput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool ispassword;
  final String hinttext;
  final TextInputType textInputType;
  const Textfieldinput(
      {super.key,
      required this.textEditingController,
      this.ispassword = false,
      required this.hinttext,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hinttext,
          border: InputBorder,
          focusedBorder: InputBorder,
          enabledBorder: InputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
      obscureText: ispassword,
    );
  }
}
