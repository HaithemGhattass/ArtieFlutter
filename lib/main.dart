import 'package:artie/screens/control.dart';
import 'package:artie/screens/draw_screen.dart';
import 'package:artie/screens/home_screen.dart';
import 'package:artie/screens/onboarding_screen.dart';
import 'package:artie/screens/signin_screen.dart';
import 'package:artie/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      //  home: const OnBoardingScreen(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const OnBoardingScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/signin': (context) => SignIn(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUp(),
        '/control': (context) => ControlScreen(),
        '/draw': (context) => const ColorGame()
      },
    );
  }
}
