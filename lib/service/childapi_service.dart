import 'dart:convert';
import 'dart:io';
import 'package:artie/constants.dart';
import 'package:artie/models/child.dart';
import 'package:artie/models/image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'userapi_service.dart';

import 'package:http/http.dart' as http;

class ChildApiService {
  //static const String _baseUrl = "http://192.168.50.73:9090";
  static String? age = "6";
  static late String? name = "farahh";

  static Future<void> AddChild(File? _image) async {
    if (_image != null) {
      final uri = Uri.parse(Constants.baseUrl + '/child');
      final request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('image', _image!.path))
        ..fields['name'] = name!
        ..fields['age'] = age!
        ..fields['user'] = UserApiServicee.getCurrentUserId()!;
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Image upload failed with status ${response.statusCode}');
      }
    }
  }

  static Future<List<Child>> getChildsByUser() async {
    print("dkhalet");
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? id = prefs.getString('id');

      final response =
          await http.get(Uri.parse(Constants.baseUrl + "/child/" + id!));
      final json = jsonDecode(response.body);
      print('----' + id + '-----');
      print(json);

      return json
          .map<Child>((productJson) => Child(
                id: productJson['_id'],
                name: productJson['name'],
                age: productJson['age'],
                image: productJson['image'],
                //user: productJson['user']
              ))
          .toList();
    } catch (e) {
      print(
          "Une erreur s'est produite lors de la récupération des informations relatives aux enfants.");
      // Afficher un message d'erreur à l'utilisateur en cas d'erreur

      return [];
    }
  }

  // Other API methods...
  static Future<List<Draw>> getimages() async {
    print("dkhalet");
    try {
      final response =
          await http.get(Uri.parse(Constants.baseUrl + "/image/flutter/"));
      final json = jsonDecode(response.body);
      print(json);
      return json
          .map<Draw>((productJson) => Draw(
                id: productJson['_id'],
                image: productJson['image'],
                childAge: productJson['childAge'],
                //user: productJson['user']
              ))
          .toList();
    } catch (e) {
      print(e);
      print(
          "Une erreur s'est produite lors de la récupération des informations relatives aux enfants.");
      // Afficher un message d'erreur à l'utilisateur en cas d'erreur

      return [];
    }
  }

  // Other API methods...
}
