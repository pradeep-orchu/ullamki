import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ullamki/components/my_textfield.dart';

class AddUserDetailsScreen extends StatefulWidget {
  const AddUserDetailsScreen({super.key});

  @override
  State<AddUserDetailsScreen> createState() => _AddUserDetailsScreenState();
}

class _AddUserDetailsScreenState extends State<AddUserDetailsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('vallanki');
  final _imagePicker = ImagePicker();

  File? _image;
  String? _imageUrl;

  Future<void> _uploadImage() async {
    // Pick an image from the user's gallery or camera.
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    final file = await image!.readAsBytes();
    String bif = 'YOUR_BUCKET_ID';
    String idd = ID.unique();

    // Upload the image to Appwrite.
    final response = await Storage(client).createFile(
        bucketId: bif,
        fileId: idd,
        file: InputFile.fromBytes(bytes: file, filename: 'fdkksdkl'));
  }

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
                controller: bioController, hintText: 'Bio', obscureText: false),
            SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: phoneController,
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
