import 'dart:convert';
import 'package:artie/models/image.dart';
import 'package:artie/services/server_URL.dart';
import 'package:http/http.dart' as http;

class ImageApiService {
 

static late num age;
    static Future<List<Imagee>> getImagesByAgeChild() async {
    final response = await http.get(Uri.parse(Server_URL.baseUrl+"/image/"+age.toString()));
    final json = jsonDecode(response.body);
    return json.map<Imagee>((productJson) => Imagee(
      id: productJson['_id'],
      image: productJson['image'],
      gCode: productJson['gCode'],
      childAge: productJson['childAge'],
    )).toList();
    
  }
}