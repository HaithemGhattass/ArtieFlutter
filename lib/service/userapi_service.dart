import 'dart:convert';
import 'package:artie/models/user.dart';
import 'package:artie/constants.dart';
import 'package:artie/screens/home_screen.dart';
import 'package:artie/screens/profile_screen.dart';
import 'package:artie/screens/signin_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/keyboard.dart';
import '../screens/changepwd_screen.dart';
import '../screens/otp_screen.dart';

class UserApiServicee {
  static User? _user;
  static String? name;
  static String? email;
  static String? password;
  static String? code;
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

  static Future<String?> signUp(dynamic context) async {
    final response = await http.post(
      Uri.parse(Constants.baseUrl + "/user/add"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'pwd': password}),
    );
    print(email);

    print(password);
    if (response.statusCode == 200) {
      KeyboardUtil.hideKeyboard(context);
      final Map<String, dynamic> responseData = json.decode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignIn(), fullscreenDialog: true),
      );
    } else if (response.statusCode == 400) {
      showDialog(
          context: context,
          builder: (builder) {
            return const AlertDialog(
                title: Text("Erreur"),
                content: Text("Mot de passe ou email invalides"));
          });
    } else if (response.statusCode == 403) {
      showDialog(
          context: context,
          builder: (builder) {
            return const AlertDialog(
                title: Text("Erreur"), content: Text("email already exists"));
          });
    }
  }

  static Future<String?> forgetPWD(dynamic context) async {
    final response = await http.post(
      Uri.parse(Constants.baseUrl + "/user/recover"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    print(email);

    print(password);
    if (response.statusCode == 200) {
      KeyboardUtil.hideKeyboard(context);
      final Map<String, dynamic> responseData = json.decode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Otp(), fullscreenDialog: true),
      );
    } else if (response.statusCode == 400) {
      showDialog(
          context: context,
          builder: (builder) {
            return const AlertDialog(
                title: Text("Erreur"), content: Text("email invalide"));
          });
    }
  }

  static Future<String?> VerifyOtp(dynamic context) async {
    final response = await http.post(
      Uri.parse(Constants.baseUrl + "/user/changepwcode"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'code': code}),
    );
    print(email);

    print(password);
    if (response.statusCode == 200) {
      KeyboardUtil.hideKeyboard(context);
      final Map<String, dynamic> responseData = json.decode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Changepw(email: email.toString()),
            fullscreenDialog: true),
      );
    } else if (response.statusCode == 400) {
      showDialog(
          context: context,
          builder: (builder) {
            return const AlertDialog(
                title: Text("Erreur"), content: Text("code invalide"));
          });
    }
  }

  static Future<String?> changepw(dynamic context) async {
    final response = await http.post(
      Uri.parse(Constants.baseUrl + "/user/resetpwd"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'pwd': password}),
    );
    print(email);

    print(password);
    if (response.statusCode == 200) {
      KeyboardUtil.hideKeyboard(context);
      final Map<String, dynamic> responseData = json.decode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignIn(), fullscreenDialog: true),
      );
    } else if (response.statusCode == 400) {
      showDialog(
          context: context,
          builder: (builder) {
            return const AlertDialog(
                title: Text("Erreur"), content: Text("code invalide"));
          });
    }
  }

  static Future<String?> Update(String email, dynamic context) async {
    final response = await http.put(
      Uri.parse(Constants.baseUrl + "/user/update/$email"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email}),
    );
    print(email);

    print(password);
    if (response.statusCode == 200) {
      KeyboardUtil.hideKeyboard(context);
      final Map<String, dynamic> responseData = json.decode(response.body);
      _user = User.fromJson(responseData);
      id = _user!.id;
      id2 = _user!.id;

      print('(------)');

      print(_user!.id);
      print(_user!.name);
      print(_user!.pwd);
      print('(------)');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('name');
      await prefs.remove('name');
      await prefs.setString('id', _user!.id);
      await prefs.setString('name', _user!.name);
      await prefs.setString('email', _user!.email);
      print(responseData);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(), fullscreenDialog: true),
      );
    } else if (response.statusCode == 400) {
      showDialog(
          context: context,
          builder: (builder) {
            return const AlertDialog(
                title: Text("Erreur"), content: Text("nom ou email invalides"));
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
              code: productJson['code'],
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
