import 'package:flutter/material.dart';
import 'package:artie_flutter/components/custom_surfix_icon.dart';
import 'package:artie_flutter/components/default_button.dart';
import 'package:artie_flutter/components/form_error.dart';
import 'package:artie_flutter/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final String baseUrl = "192.168.1.8:9090";
  final List<String?> errors = [];
  String? name;
  String? age;
  String? phoneNumber;
  String? address;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
      
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                   Map<String, dynamic> userData = {
                          "name": name,
                          "age": age
                          
                          
                        };
                         Map<String, String> headers = {
                          "Content-Type": "application/json; charset=UTF-8"
                        };
                        http
                            .post(Uri.http(baseUrl, "/child"),
                                headers: headers, body: json.encode(userData))
                            .then((http.Response response) {
                               if (response.statusCode == 200) {
                                Navigator.pushNamed(context, '/home');
              }

                               });
                            }

            },
          ),
        ],
      ),
    );
  }



  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => age = newValue ,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Age",
        hintText: "Enter your child's age",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }



  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your child's name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}