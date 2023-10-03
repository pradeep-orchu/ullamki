import 'dart:core';

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final AssetImage logo;
  final Function()? onTap;

  const MyButton(
      {super.key, required this.onTap, required this.name, required this.logo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            //color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(25),
            border:
                Border.all(color: Theme.of(context).colorScheme.onBackground)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: logo,
                fit: BoxFit.cover,
                height: 30,
              ),
              Text(
                "Sign In with $name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                width: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
