import 'package:artie/components/costum/rounded_input_field_child_name.dart';
import 'package:artie/components/costum/rounded_input_field_child_age.dart';

import 'package:artie/service/childapi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:artie/components/costum/rounded_input_field.dart';

import 'addImage_screen.dart';

class AddChild extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFE7EEFB),
      title: Text(AppLocalizations.of(context)!.createSpace),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           RoundedInputFieldChildName(
                                 hintText: AppLocalizations.of(context)!.name , icon: Icons.child_care),

           RoundedInputFieldChildAge(
                                 hintText: AppLocalizations.of(context)!.age , icon: Icons.date_range_outlined),
     
          
          OutlinedButton.icon(
            icon: Icon(Icons.cloud_upload),
            label: Text('choose', style: TextStyle(color: Colors.black)),
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
          child: Text('canel'),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Handle form submission
            Navigator.of(context).pop();
          },
          child: Text('save'),
          style: ElevatedButton.styleFrom(
                 primary:       Color(0xFF0971FE).withOpacity(0.6),

          //  primary: Color.fromARGB(255, 169, 218, 141),
          ),
        ),
      ],
    );
  }
}
