
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
      title: Text(AppLocalizations.of(context)!.craeteSpace),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           TextFormField(
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.name,
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
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
        labelText: AppLocalizations.of(context)!.age,
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),  
                onChanged: (String? value) {
                  ChildApiService.age = value!;
                },
            keyboardType: TextInputType.number,
          ),
         
         
             OutlinedButton.icon(
              icon:Icon(Icons.cloud_upload) ,
              
              label: Text( AppLocalizations.of(context)!.chooseAnImage,style: TextStyle(color: Colors.black)),
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
          child: Text(AppLocalizations.of(context)!.cancel),
      style: ElevatedButton.styleFrom(
      primary: Colors.grey,
    ),
        ),
        ElevatedButton(
          onPressed: () {
           
            // TODO: Handle form submission
            Navigator.of(context).pop();},
      
          child: Text(AppLocalizations.of(context)!.save),
          style: ElevatedButton.styleFrom(
      primary: Color(0xFFF5CEB8),
    ),
        ),
      ],
    );
  }
}

