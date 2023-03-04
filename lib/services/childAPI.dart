import 'dart:convert';
import 'dart:io';
import 'package:artie/models/child.dart';

import 'package:artie/services/userAPI.dart';
import 'package:http/http.dart' as http;

class ChildApiService {
  static const String _baseUrl = "http://192.168.50.73:9090";
static String age = "6";
static late String? name ="farahh";

 static Future<void> AddChild(File? _image) async {
  if (_image!= null) {
    final uri = Uri.parse('http://192.168.50.73:9090/child');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', _image!.path))
      ..fields['name'] = name!
      ..fields['age'] = "12"
      ..fields['user'] = UserApiService.getCurrentUserId()!;
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Image upload failed with status ${response.statusCode}');
    }
  }
}












  static Future<List<Child>> getChildsByUser() async {
    final response = await http.get(Uri.parse(_baseUrl+"/child/"+UserApiService.getCurrentUserId()!));
    final json = jsonDecode(response.body);
    return json.map<Child>((productJson) => Child(
      id: productJson['_id'],
      name: productJson['name'],
      age: productJson['age'],
      image: productJson['image'],
      //user: productJson['user']
     
    )).toList();
    
  }




  // Other API methods...
}