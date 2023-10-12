import 'package:flutter/material.dart';

class DopeScreen extends StatefulWidget {
  const DopeScreen({super.key});

  @override
  State<DopeScreen> createState() => _DopeScreenState();
}

class _DopeScreenState extends State<DopeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Vallanki',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
