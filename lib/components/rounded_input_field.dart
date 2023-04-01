import 'package:artie/components/text_field_container.dart';
import 'package:flutter/material.dart';
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
