import 'package:flutter/material.dart';
import 'package:ullamki/screens/notification/chat_screen.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pradeep Krishna',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Container(
                    child: Text(
                      'Ownerjjsdjjsadjfiafjdkjklfjskdfjlkjsafdkljlaksjdflkjaslkfdjkljfs',
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
