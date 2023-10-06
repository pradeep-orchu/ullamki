import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:ullamki/components/user_profile.dart';
import 'package:ullamki/utils/userdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('vallanki');
  UserDetails? userDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Vallanki'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'search');
              },
              icon: Icon(Icons.search_outlined))
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Center(child: UserProfile()), Text('Notification')],
          ),
        ),
      ),
      body: userDetails != null
          ? Center(
              child: Text('Home'),
            )
          : Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'search');
                  },
                  child: Text('Search')),
            ),
    );
  }
}
