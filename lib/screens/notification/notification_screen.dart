import 'package:flutter/material.dart';
import 'package:ullamki/components/message_tile.dart';
import 'package:ullamki/components/my_textfield.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text('Notifications'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                controller: searchController,
                hintText: 'Search',
                obscureText: false,
                icon: Icon(Icons.search_outlined),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return MessageTile();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
