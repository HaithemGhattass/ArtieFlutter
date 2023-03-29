
import 'package:artie/screens/userViews/addImageTest.dart';
import 'package:artie/services/childAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.name),
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
            decoration: InputDecoration(labelText: 'Age'),
             
                onChanged: (String? value) {
                  ChildApiService.age = value!;
                },
            keyboardType: TextInputType.number,
          ),
             OutlinedButton.icon(
              icon:Icon(Icons.cloud_upload) ,
              label: Text("Choose an Image"),
                onPressed: () {
                  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageUploadScreen(),
      ),
    );
                  
                  // TODO: Pick an image from the gallery
                },
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

