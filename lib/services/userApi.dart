import 'dart:convert';
import 'package:artie/models/user.dart';
import 'package:artie/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../helper/keyboard.dart';

class UserApiService {
  static User? _user;

  // Se connecter avec email et mot de passe
  static Future<String?> signInWithEmailAndPassword(
      String email, String pwd, dynamic context) async {
    final response = await http.post(
      Uri.parse(Constants.baseUrl + "/user"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'pwd': pwd}),
    );

    if (response.statusCode == 200) {
      KeyboardUtil.hideKeyboard(context);
      Navigator.pushNamed(context, "/home");
      final Map<String, dynamic> responseData = json.decode(response.body);
      _user = User.fromJson(responseData['user']);
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
    if (_user != null) {
      return _user!.id;
    } else {
      return null;
    }
  }

  // Other API methods...
}
