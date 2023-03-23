
import 'package:artie/screens/userViews/imageListByChild.dart';
import 'package:artie/services/server_URL.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  
 
  ImageCard({required this.imageUrl});

@override
Widget build(BuildContext context) {
  return InkWell(
    onTap: () {
      
      
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
        //  Text(name),
        ],
      ),
    ),
  );
}
}
