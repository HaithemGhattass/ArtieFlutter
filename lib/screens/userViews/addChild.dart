import 'package:artie/screens/userViews/addImageTest.dart';
import 'package:artie/services/childAPI.dart';
import 'package:flutter/material.dart';

class AddChild extends StatelessWidget {




    final _formKey = GlobalKey<FormState>();


  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('My Form'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (String? value) {
                  ChildApiService.name = value!;
                },
              ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Birthdate',
            ),
            keyboardType: TextInputType.datetime,
          ),
             ElevatedButton(
                onPressed: () {
                  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageUploadScreen(),
      ),
    );
                  
                  // TODO: Pick an image from the gallery
                },
                child: Text('Choose an Image'),
              ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            //  if (_formKey.currentState!.validate()) {
              //      _formKey.currentState!.save();
           // ChildApiService.addOnce(_name,_age);
            // TODO: Handle form submission
            Navigator.of(context).pop();},
          //},
          child: Text('Save'),
        ),
      ],
    );
  }
}

