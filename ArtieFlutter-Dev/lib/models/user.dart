class User {
  final String id;
  final String name;
  final String email;
  final String pwd;
  //final String code;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.pwd
     // required this.code
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        pwd: json['pwd']
       // code: json['code']
        );
  }
}
