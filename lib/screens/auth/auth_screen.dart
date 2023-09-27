import 'package:flutter/material.dart';
import 'package:ullamki/screens/auth/signin_screen.dart';
import 'package:ullamki/screens/auth/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool sign = true;
  void toggle() {
    setState(() {
      sign = !sign;
    });
  }

  @override
  Widget build(BuildContext context) {
    return sign ? SignInScreen(onTap: toggle) : SignUpScreen(onTap: toggle);
  }
}
