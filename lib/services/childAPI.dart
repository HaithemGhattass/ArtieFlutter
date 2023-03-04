import 'dart:convert';
import 'dart:io';
import 'package:artie/models/child.dart';
import 'package:artie/models/user.dart';
import 'package:artie/services/userAPI.dart';
import 'package:http/http.dart' as http;

class ChildApiService {
  static const String _baseUrl = "http://192.168.1.103:9090";


static Future<void> addOnce(String name,num age) async {
  var request = http.MultipartRequest('POST', Uri.parse(_baseUrl+"/child"));

  // Ajouter les champs de la requête
  request.fields['name'] = name;
  request.fields['age'] = age.toString();
  request.fields['user'] = UserApiService.getCurrentUserId()!;

  // Créer un objet de fichier à partir de l'image
  var imageFile = File('path/to/image.jpg');
  var stream = http.ByteStream(imageFile.openRead());
  var length = await imageFile.length();
  var multipartFile = http.MultipartFile('image', stream, length, filename: imageFile.path);

  // Ajouter le fichier à la requête
  request.files.add(multipartFile);

  // Envoyer la requête
  var response = await request.send();

  // Vérifier la réponse
  if (response.statusCode == 200) {
    print('Success');
  } else {
    print('Error: ${response.reasonPhrase}');
  }
}


  // Se connecter avec email et mot de passe

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