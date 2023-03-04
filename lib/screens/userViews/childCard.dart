import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  UserCard({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          
          Image.network('http://192.168.1.103:9090/img/'+imageUrl, width: 200,
            height: 140,
            fit: BoxFit.cover,
          ),
          Text(name),
        ],
      ),
    );
  }
}
