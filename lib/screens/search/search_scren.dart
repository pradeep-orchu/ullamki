import 'package:flutter/material.dart';
import 'package:ullamki/components/my_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

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
            ],
          ),
        ),
      ),
    );
  }
}
