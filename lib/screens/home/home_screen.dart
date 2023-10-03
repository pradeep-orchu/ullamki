import 'package:flutter/material.dart';
import 'package:ullamki/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  void SignOut() {
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined),
            Text('Eluru,AP'),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'search');
              },
              icon: Icon(Icons.search_outlined))
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
                child: Center(
                    child: Text(
              'Ullanki',
              style: Theme.of(context).textTheme.displayMedium,
            ))),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'notification');
              },
              child: Text(
                'Notification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'settings');
              },
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            TextButton(
              onPressed: SignOut,
              child: Text(
                'Sign out',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
