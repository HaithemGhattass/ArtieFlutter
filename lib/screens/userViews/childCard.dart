
import 'package:artie/screens/userViews/imageListByChild.dart';
import 'package:artie/services/imageAPI.dart';
import 'package:artie/services/server_URL.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String name;
 final num age;
  UserCard({required this.imageUrl, required this.name, required this.age});

@override
Widget build(BuildContext context) {
  return InkWell(
    onTap: () {
      ImageApiService.age=age;
      //ImageApiService.getImagesByAgeChild();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageListByChild()),
      );
    },
    child: Card(
      child: Column(
        children: [
          Image.network(
            Server_URL.baseUrl+'/img/' + imageUrl,
            width: 200,
            height: 140,
            fit: BoxFit.cover,
          ),
          Text(name),
        ],
      ),
    ),
  );
}
}