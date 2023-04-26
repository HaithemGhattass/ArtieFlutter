import 'package:artie/service/userapi_service.dart';
import 'package:flutter/material.dart';

import 'textfield_container.dart';

export 'rounded_input_field.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField(
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (input) => input!.isValidEmail() ? null : "Check your email",
        onChanged: (String? value) {
          UserApiServicee.email = value!;
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
