import 'dart:convert';
import 'package:artie/models/user.dart';
import 'package:artie/constants.dart';
import 'package:artie/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/keyboard.dart';

class UserApiServicee {
  static User? _user;
  static String? email;
  static String? password;
  static String? id;
  static String? id2;

  // Se connecter avec email et mot de passe
  static Future<String?> signInWithEmailAndPassword(dynamic context) async {
    final response = await http.post(
      Uri.parse(Constants.baseUrl + "/user"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'pwd': password}),
    );
    print(email);

    print(password);
    if (response.statusCode == 200) {
      KeyboardUtil.hideKeyboard(context);
      final Map<String, dynamic> responseData = json.decode(response.body);
      _user = User.fromJson(responseData['user']);
      id = _user!.id;
      id2 = _user!.id;

      print('(------)');

      print(_user!.id);
      print(_user!.name);
      print(_user!.pwd);
      print('(------)');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', _user!.id);
      await prefs.setString('name', _user!.name);
      await prefs.setString('email', _user!.email);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(), fullscreenDialog: true),
      );
    } else if (response.statusCode == 400) {
      showDialog(
          context: context,
          builder: (builder) {
            return const AlertDialog(
                title: Text("Erreur"),
                content: Text("Mot de passe ou email invalides"));
          });
    }
  }

  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(Constants.baseUrl + "/user"));
    final json = jsonDecode(response.body);
    return json
        .map<User>((productJson) => User(
              id: productJson['_id'],
              name: productJson['name'],
              email: productJson['email'],
              pwd: productJson['pwd'],
            ))
        .toList();
  }

  // Récupérer l'ID de l'utilisateur connecté
  static String? getCurrentUserId() {
    print('dkhlt2');
    if (_user != null) {
      print('dkhlt3');
      print(_user!.id);
      return _user!.id;
    } else {
      print('null');
      return null;
    }
  }

  // Other API methods...
}