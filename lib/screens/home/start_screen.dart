import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:ullamki/components/user_profile.dart';
import 'package:ullamki/screens/auth/auth_screen.dart';
import 'package:ullamki/screens/auth/signin_screen.dart';
import 'package:ullamki/screens/home/home_screen.dart';

class StartScreen extends StatefulWidget {
  StartScreen({
    super.key,
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  Account account = Account(Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('vallanki'));
  User? loggedInUser;
  @override
  void initState() {
    super.initState();
    state();
  }

  Future<void> state() async {
    final user = await account.get();
    setState(() {
      loggedInUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    // If the user is logged in, navigate to the home screen.
    return loggedInUser != null ? HomeScreen() : AuthScreen();
  }
}
