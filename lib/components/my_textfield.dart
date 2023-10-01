import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon? icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              // borderSide:
              //     BorderSide(color: Theme.of(context).colorScheme.background),
              borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          //filled: true,
          hintText: hintText,
          prefixIcon: icon,
          hintStyle: TextStyle(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
