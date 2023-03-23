import 'package:artie/constants.dart';
import 'package:artie/screens/splash/splash_screen.dart';
import 'package:artie/screens/userViews/childByUser.dart';
import 'package:artie/screens/userViews/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
        localizationsDelegates: [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('en'),
    Locale('fr'), 
    Locale('ar'), 

  ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     // home: SplashScreen(),
   home: HomeScreen(),
    );
  }
}
