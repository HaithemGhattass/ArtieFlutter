import 'package:artie/service/childapi_service.dart';
import 'package:flutter/material.dart';

import 'textfield_container.dart';

export 'rounded_input_field.dart';

class RoundedInputFieldChildAge extends StatelessWidget {
  const RoundedInputFieldChildAge(
      {Key? key, this.hintText, this.icon = Icons.person, this.val})
      : super(key: key);
  final String? hintText;
  final dynamic? val;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const kPrimaryColor = Color.fromARGB(255, 139, 192, 230);
    var getvalue = val;
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (newValue) => getvalue = newValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        
        validator: (input) =>   input!.isNotEmpty ? null : "child age should not be empty",
        onChanged: (String? value) {
              ChildApiService.age = value!;
            },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
      ),
    );
  }
}


