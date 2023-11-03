import 'dart:convert';
import 'package:artie/constants.dart';
import 'package:artie/models/image%20copy.dart';
import 'package:http/http.dart' as http;

class ImageApiService {
 

static late num age =0;
    static Future<List<Imagee>> getImagesByAgeChild() async {
    final response = await http.get(Uri.parse(Constants.baseUrl+"/image/"+age.toString()));
    final json = jsonDecode(response.body);
    return json.map<Imagee>((productJson) => Imagee(
      id: productJson['_id'],
      image: productJson['image'],
      gCode: productJson['gCode'],
      childAge: productJson['childAge'],
    )).toList();
    
  }
}