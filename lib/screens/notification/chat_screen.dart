import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:ullamki/components/chat_tile.dart';
import 'package:ullamki/components/message_tile.dart';
import 'package:ullamki/components/my_textfield.dart';
import 'package:ullamki/service/message_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController chatController = TextEditingController();
  final database = MessageService();
  late List<Document>? messages = [];
  TextEditingController messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  loadMessages() async {
    try {
      final value = await database.getMessages();
      setState(() {
        messages = value.documents;
      });
    } catch (e) {
      print(e);
    }
  }

  addMessage() async {
    try {
      await database.addMessage(message: chatController.text);
      const snackbar = SnackBar(content: Text('Message added!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      messageTextController.clear();
      loadMessages();
    } on AppwriteException catch (e) {
      print(e.message.toString());
      showAlert(title: 'Error', text: e.message.toString());
    }
  }

  deleteMessage(String id) async {
    try {
      await database.deleteMessage(id: id);
      loadMessages();
    } on AppwriteException catch (e) {
      showAlert(title: 'Error', text: e.message.toString());
    }
  }

  showAlert({required String title, required String text}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pradeep Krishna'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: messages?.length ?? 0,
                itemBuilder: (context, index) {
                  final message = messages![index];
                  return Card(
                      child: ListTile(
                    title: Text(message.data['text']),
                    trailing: IconButton(
                        onPressed: () {
                          deleteMessage(message.$id);
                        },
                        icon: const Icon(Icons.delete)),
                  ));
                }),
          ),
          SizedBox(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: chatController,
                      decoration: InputDecoration(
                          hintText: 'Message',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                      obscureText: false),
                ),
                SizedBox(
                  width: 5,
                ),
                IconButton.filledTonal(
                    splashRadius: 25,
                    iconSize: 40,
                    onPressed: addMessage,
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
