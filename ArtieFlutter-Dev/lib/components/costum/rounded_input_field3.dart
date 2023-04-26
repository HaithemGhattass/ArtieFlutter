import 'package:artie/service/userapi_service.dart';
import 'package:flutter/material.dart';

import 'textfield_container.dart';


class RoundedInputField3 extends StatelessWidget {
  const RoundedInputField3(
      {Key? key, this.hintText, this.icon = Icons.person, this.val})
      : super(key: key);
  final String? hintText;
  final dynamic? val;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const kPrimaryColor = Color(0xfff1bb274);
    var getvalue = val;
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => getvalue = newValue,
        onChanged: (String? value) {
          UserApiServicee.code = value!;
          
          // UserApiServicee.id = 'aaaaa';
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
