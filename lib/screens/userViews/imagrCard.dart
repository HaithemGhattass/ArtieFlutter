import 'package:artie/screens/userViews/imageListByChild.dart';
import 'package:artie/services/server_URL.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final int index; // l'index de l'image dans la liste

  ImageCard({required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    // Define a list of colors to choose from
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.purple,
      Colors.yellow,
    ];
    final colorIndex = index % colors.length; // to cycle between colors

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImageListByChild()),
        );
      },
      child: Card(
        
        child: Container(
          color: colors[colorIndex][50],
          
          child: Column(
            
            children: [
              Image.network(
                Server_URL.baseUrl + '/img/' + imageUrl,
                width: 200,
                height: 140,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
