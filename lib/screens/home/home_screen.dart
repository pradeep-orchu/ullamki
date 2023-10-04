import 'package:flutter/material.dart';
import 'package:ullamki/components/user_profile.dart';
import 'package:ullamki/utils/userdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: DrawerHeader(child: Center(child: UserProfile())),
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
