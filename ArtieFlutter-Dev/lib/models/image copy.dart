class Imagee {
  final String id ;
  final String gCode;
  final num childAge;
    final String image;
    //final User user;

 Imagee({required this.id, required this.gCode, required this.childAge, required this.image});

factory Imagee.fromJson(Map<String, dynamic> json) {
    return Imagee(
      id: json['_id'],
      gCode: json['gCode'],
      childAge: json['childAge'],
      image:json['image']
      //user:json['user']
    );
  }
}
