import 'package:appwrite/appwrite.dart';
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
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('vallanki');

  void error(e) {
    print(e);
  }

  Future<bool> isLoggedIn() async {
    try {
      Future response = Account(client).get();
      // The user is logged in.
      response.then((value) => true);
      return true;
    } catch (error) {
      // The user is not logged in.
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // If the user is logged in, navigate to the home screen.
    return FutureBuilder(
      future: isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return AuthScreen();
        }
      },
    );
  }
}
