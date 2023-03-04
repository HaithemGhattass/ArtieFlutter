import 'dart:io';
import 'package:artie/services/childAPI.dart';
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
  static late String name = "xx " ;
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
      appBar: AppBar(title: const Text('Image Upload')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) Image.file(_image!),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: const Text('Pick from Gallery'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: const Text('Take a Picture'),
            ),
            ElevatedButton(
          onPressed: () 
              {ChildApiService.AddChild(_image);
              

    Navigator.of(
      context,
  
    ).pop();},
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
