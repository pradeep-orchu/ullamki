import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Text(
        'Ownerjjsdjjsadjfiafjdkjklfjskdfjlkjsafdkljlaksjdflkjaslkfdjkljfs',
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
      ),
    );
  }
}
