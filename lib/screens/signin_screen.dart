import 'dart:ui';

import 'package:artie/components/costum/costum_outline.dart';
import 'package:artie/components/costum/rounded_button.dart';
import 'package:artie/components/costum/rounded_input_field.dart';
import 'package:artie/components/costum/rounded_password_field.dart';
import 'package:artie/constants.dart';
import 'package:artie/service/userapi_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignIn extends StatefulWidget {
  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? pwd;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
                top: screenHeight * 0.1,
                left: -88,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Constants.kGreyColor),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 200,
                        sigmaY: 200,
                      ),
                      child: Container(
                        height: 166,
                        width: 166,
                        color: Colors.transparent,
                      )),
                )),
            Positioned(
              top: screenHeight * 0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Constants.kWhiteColor),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  CustomOutline(
                    strokeWidth: 4,
                    radius: screenWidth * 0.8,
                    padding: const EdgeInsets.all(4),
                    width: screenWidth * 0.8,
                    height: screenWidth * 0.8,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF0971FE),
                          Color(0xFFA6AEBD).withOpacity(0),
                          Color(0xFF0971FE).withOpacity(0.1),
                          Color(0xFF0971FE)
                        ],
                        stops: const [
                          0.2,
                          0.4,
                          0.6,
                          1
                        ]),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          alignment: Alignment.bottomLeft,
                          image: AssetImage('asset/illustrations/logo2.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const RoundedInputField(
                            hintText: "Email", icon: Icons.email),
                        const RoundedPasswordField(),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 40),
                          child: SwitchListTile(
                            dense: true,
                            title: const Text(
                              'Remember Me',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'OpenSans',
                                  color: Constants.kGreyColor),
                            ),
                            value: remember!,
                            activeColor: Constants.kGreenColor,
                            onChanged: (value) {
                              setState(() {
                                remember = value;
                              });
                            },
                          ),
                        ),
                        RoundedButton(
                            text: 'LOGIN',
                            press: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Map<String, dynamic> userData = {
                                  "email": email,
                                  "pwd": pwd
                                };
                                Map<String, String> headers = {
                                  "Content-Type":
                                      "application/json; charset=UTF-8"
                                };

                                UserApiServicee.signInWithEmailAndPassword(
                                    context);
                                /*  .then((a) => {
                                          print('aaa'),
                                          ChildApiService.getChildsByUser()
                                              .then((value) =>
                                                  Navigator.pushNamed(
                                                      context, "/home"))
                                        }); */
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Constants.kGreenColor,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(
            fontSize: 16, fontFamily: 'OpenSans', color: Constants.kGreyColor),
      ),
      value: true,
      activeColor: Constants.kGreenColor,
      onChanged: (val) {},
    ),
  );
}
