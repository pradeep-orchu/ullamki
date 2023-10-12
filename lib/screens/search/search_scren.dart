import 'package:flutter/material.dart';
import 'package:ullamki/components/flat_tile.dart';
import 'package:ullamki/components/message_tile.dart';
import 'package:ullamki/components/my_textfield.dart';
import 'package:ullamki/utils/userdetails.dart';

class SearchScreen extends StatefulWidget {
  final UserDetails? userDetails;
  const SearchScreen({super.key, this.userDetails});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
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
                    return FlatTile();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
