import 'dart:io';
import 'package:artie/service/childapi_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  void someMethod(void Function() _updateChilds) {
    // Faire quelque chose avant de mettre à jour les enfants
    _updateChilds();
    // Faire quelque chose après avoir mis à jour les enfants
  }

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  static late String name = "xx ";
  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Image'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) Image.file(_image!),
            Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // ou MainAxisAlignment.spaceBetween
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 155, 153, 152),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        icon: Icon(Icons.photo_library),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 155, 153, 152),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => _pickImage(ImageSource.camera),
                        icon: Icon(Icons.photo_camera),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 155, 153, 152),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => {
                          ChildApiService.AddChild(_image),
                          Navigator.of(context).pop()
                        },
                        icon: Icon(Icons.cloud_upload),
                      ),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
