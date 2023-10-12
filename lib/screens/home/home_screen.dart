import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:ullamki/components/home_grid.dart';
import 'package:ullamki/components/note.dart';
import 'package:ullamki/components/user_profile.dart';
import 'package:ullamki/examp/dope_screen.dart';
import 'package:ullamki/examp/map.dart';
import 'package:ullamki/screens/notification/notification_screen.dart';
import 'package:ullamki/screens/search/search_scren.dart';
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SearchScreen())));
                },
                icon: Icon(Icons.search_outlined))
          ],
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: UserProfile()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationScreen()));
                          },
                          icon: Icon(Icons.notifications_outlined)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapScreenEx()));
                          },
                          icon: Icon(Icons.location_on_outlined)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DopeScreen()));
                          },
                          icon: Icon(Icons.developer_board_outlined)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                HomeGrid(),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    // reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Note();
                    }),
              ],
            ),
          ),
        ));
  }
}
