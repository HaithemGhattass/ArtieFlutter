import 'package:artie/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<bool> fetchedUser;
  late String route;
  Future<bool> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("id")) {
      route = "/home";
    } else {
      route = "/";
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchedUser = fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchedUser,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          if (route == "/home") {
            return HomeScreen();
          } else {
            return SignIn();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
