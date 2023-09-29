import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            //color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(25),
            border:
                Border.all(color: Theme.of(context).colorScheme.onBackground)),
        child: Center(
          child: Text(
            "Sign In",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
