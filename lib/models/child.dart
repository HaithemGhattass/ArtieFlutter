import 'package:artie/models/user.dart';

class Child {
  final String id ;
  final String name;
  final num age;
    final String image;
    //final User user;

 Child({required this.id, required this.name, required this.age, required this.image});

factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      id: json['_id'],
      name: json['name'],
      age: json['age'],
      image:json['image']
      //user:json['user']
    );
  }
}