import 'package:artie/service/userapi_service.dart';
import 'package:flutter/material.dart';

import 'textfield_container.dart';

export 'rounded_input_field.dart';

class RoundedInputField2 extends StatelessWidget {
  const RoundedInputField2(
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
        keyboardType: TextInputType.name,
        onSaved: (newValue) => getvalue = newValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (input) =>
            input!.isNotEmpty ? null : "name should not be empty",
        onChanged: (String? value) {
          UserApiServicee.name = value!;

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
