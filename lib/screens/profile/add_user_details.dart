import 'package:flutter/material.dart';
import 'package:ullamki/components/my_textfield.dart';

class AddUserDetailsScreen extends StatefulWidget {
  const AddUserDetailsScreen({super.key});

  @override
  State<AddUserDetailsScreen> createState() => _AddUserDetailsScreenState();
}

class _AddUserDetailsScreenState extends State<AddUserDetailsScreen> {
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done))],
      ),
      body: Center(
        child: Column(
          children: [
            Stack(children: [
              CircleAvatar(
                child: Icon(
                  Icons.person_outline,
                  size: 50,
                ),
                radius: 80,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        child: Icon(
                          Icons.edit,
                        )),
                  ))
            ]),
            SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false),
            SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: nameController,
                hintText: 'Bio',
                obscureText: false),
            SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: nameController,
                hintText: 'Phone Number',
                obscureText: false),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
