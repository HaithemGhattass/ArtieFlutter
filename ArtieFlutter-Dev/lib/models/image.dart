import 'package:artie/models/user.dart';

class Draw {
  final String id;
  final String image;
  final int childAge;
  //final User user;

  Draw({
    required this.id,
    required this.image,
    required this.childAge,
  });

  factory Draw.fromJson(Map<String, dynamic> json) {
    return Draw(
      id: json['_id'],
      image: json['image'],
      childAge: json['childAge'],

      //user:json['user']
    );
  }
}
