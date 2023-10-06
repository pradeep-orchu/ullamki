import 'package:appwrite/appwrite.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ullamki/utils/userdetails.dart';

class UserProfile extends StatelessWidget {
  final UserDetails? userDetails;
  UserProfile({super.key, this.userDetails});
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('vallanki');

  Future<void> logout() async {
    // Get the current session ID.

    try {
      await Account(client).deleteSessions();

      // The user is now logged out.
    } catch (error) {
      // Handle the error.
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userDetails == null) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    Account(client).deleteSessions();
                  },
                  child: Icon(Icons.logout))
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
                Navigator.pushNamed(context, 'details');
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
          CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: userDetails!.photoutl.toString(),
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
          Text(userDetails!.name.toString()),
        ],
      );
    }
  }
}
