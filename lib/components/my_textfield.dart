import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.background),
                borderRadius: BorderRadius.circular(25)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).focusColor),
            ),
            fillColor: Theme.of(context).colorScheme.secondaryContainer,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).hintColor)),
      ),
    );
  }
}