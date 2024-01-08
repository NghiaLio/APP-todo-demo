

// Text Input

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final controler;
  final String hintText;
  const TextInput({super.key, required this.hintText,required this.controler});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller:controler,
        style:const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: hintText,
          border:const OutlineInputBorder()
        ),
      ),
    );
  }
}