import 'dart:convert';
import 'package:artie/models/user.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  static const String _baseUrl = "http://192.168.1.103:9090";
 static User? _user;

  // Se connecter avec email et mot de passe
 static Future<String?> signInWithEmailAndPassword(
      String email, String pwd) async {
    try {
      final response = await http.post(
      Uri.parse(_baseUrl+"/user"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'pwd': pwd}),
    );
       
 if (response.statusCode == 200) {

        print("okkkk");
        final Map<String, dynamic> responseData = json.decode(response.body);
_user= User.fromJson(responseData['user']);
//print(_user!.name); // prints "farah"
        // print(response.body);
 return null;
 
 }
    } catch (error) {
      return error.toString();
    }
  }
  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(_baseUrl+"/user"));
    final json = jsonDecode(response.body);
    return json.map<User>((productJson) => User(
      id: productJson['_id'],
      name: productJson['name'],
      email: productJson['email'],
      pwd: productJson['pwd'],
    )).toList();
    
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