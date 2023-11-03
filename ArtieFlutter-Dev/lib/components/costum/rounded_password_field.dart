import 'package:artie/service/userapi_service.dart';
import 'package:flutter/material.dart';

import 'textfield_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({Key? key, this.val, this.hintText})
      : super(key: key);
  final String? val;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    const kPrimaryColor = Color(0xfff1bb274);
    var getvalue = val;
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => getvalue = newValue,
        onChanged: (String? value) => {UserApiServicee.password = value!},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (input) => input!.isValidPass()
            ? null
            : "password should have minimun length 6\n and one Upper case at least ",
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidPass() {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$').hasMatch(this);
  }
}
