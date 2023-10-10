import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ullamki/screens/profile/add_user_details.dart';
import 'package:ullamki/service/auth_api.dart';

class UserProfile extends StatefulWidget {
  UserProfile({
    super.key,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? name;
  signOut() {
    final AuthAPI appwrite = context.read<AuthAPI>();
    appwrite.signOut();
  }

  @override
  Widget build(BuildContext context) {
    if (name == null) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(onTap: signOut, child: Icon(Icons.logout))
            ],
          ),
          CircleAvatar(
            child: Icon(
              Icons.person_outline,
              size: 50,
            ),
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AddUserDetailsScreen()));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  'Add Details',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ))
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(onTap: signOut, child: Icon(Icons.logout))
            ],
          ),
          CircleAvatar(
            child: Icon(
              Icons.person_outline,
              size: 50,
            ),
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          SizedBox(
            height: 20,
          ),
          Text(name.toString()),
        ],
      );
    }
  }
}
