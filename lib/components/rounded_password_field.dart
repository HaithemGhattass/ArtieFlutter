import 'package:artie/components/text_field_container.dart';
import 'package:artie/services/userApi.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({Key? key, this.val}) : super(key: key);
  final String? val;
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
        decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "Password",
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
