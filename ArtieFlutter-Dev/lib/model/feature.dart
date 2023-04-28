import 'package:artie/screens/control.dart';
import 'package:artie/screens/draw_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Feature {
  Feature(
      {required this.featureTitle,
      required this.featureSubtitle,
      required this.background,
      required this.illustration,
      required this.logo,
      required this.intro,
      required this.view,
      required this.about});
  String intro;
  String featureTitle;
  String featureSubtitle;
  LinearGradient background;
  String illustration;
  String logo;
  Widget view;
  String about;
}
   // AppLocalizations.of(context)!.welcomeBack,


// Recent features
var recentfeatures = [
  Feature(
      featureTitle: "Learn to color and draw",
      featureSubtitle: "Learning",
      background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF00AEFF),
          Color(0xFF0076FF),
        ],
      ),
      illustration: 'drawingnobg1.png',
      logo: 'logo2.png',
      intro: 'Learn to color and draw with Artie',
      view: Container(child: ColorGame()),
      about:
          'Explore different shapes and colors. You are presented with a series of shapes, and you must choose the correct one to progress to the next level. Once you have selected the correct shape, Artie begins to draw it on the screen. You will need to repeat this process with all the shapes until the drawing is complete. Once all the shapes are drawn, you can start to color the image, using a variety of different colors and tools. This game is perfect for anyone who enjoys puzzles and wants to unleash their inner artist.'),
  Feature(
    featureTitle: "Remote control Artie",
    featureSubtitle: "Remote",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFD504F),
        Color(0xFFFF8181),
      ],
    ),
    illustration: 'acnobg.png',
    logo: 'logo2.png',
    intro: 'control artie with your remote',
    view: Container(child: ControlScreen()),
    about:
        'With the controller in hand, you can send Artie in any direction you choose, guiding it around corners, over obstacles, and through tight spaces, This remote is perfect for children who enjoy action-packed games and want to experience the thrill of controlling a powerful and unstoppable tank robot.',
  ),
/*
  Feature(
    featureTitle: "Let Artie play around",
    featureSubtitle: "Play",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00E1EE),
        Color(0xFF001392),
      ],
    ),
    illustration: 'adnobg.png',
    logo: 'logo2.png',
    intro: 'Let artie move around',
    view: Container(child: Text('theltha')),
    about:
        'As soon as you press the start button, Artie comes to life and begins moving around the house. Artie have control over his movements, and you can navigate through various obstacles and challenges',
  ),
*/
];

// Explore features
var explorefeatures = [
  Feature(
    featureTitle: "Build an app with SwiftUI",
    featureSubtitle: "22 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    illustration: 'illustration-04.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
  Feature(
    featureTitle: "Build an app with SwiftUI",
    featureSubtitle: "22 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    illustration: 'illustration-05.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
];

// Continue Watching features
var continueWatchingfeatures = [
  Feature(
    featureTitle: "Steps to use Artie features",
    featureSubtitle: "SVG Animations",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    illustration: 'illustration-06.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
];

// feature Sections
var featureSections = [
  Feature(
    featureTitle: "Build an app with SwiftUI",
    featureSubtitle: "01 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    illustration: 'illustration-01.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
  Feature(
    featureTitle: "Learn to color and draw",
    featureSubtitle: "02 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFE477AE),
        Color(0xFFC54284),
      ],
    ),
    illustration: 'illustration-08.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
  Feature(
    featureTitle: "ProtoPie Prototyping",
    featureSubtitle: "03 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFEA7E58),
        Color(0xFFCE4E27),
      ],
    ),
    illustration: 'illustration-09.png',
    logo: '',
    intro: '',
    view: Container(),
    about: '',
  ),
  Feature(
    featureTitle: "UI Design feature",
    featureSubtitle: "04 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF72CFD4),
        Color(0xFF42A0C2),
      ],
    ),
    illustration: 'illustration-10.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
  Feature(
    featureTitle: "React for Designers",
    featureSubtitle: "05 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF2E56),
        Color(0xFFCB012B),
      ],
    ),
    illustration: 'illustration-11.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
];

// Completed features
var completedfeatures = [
  Feature(
    featureTitle: "Build an ARKit 2 App",
    featureSubtitle: "Certified",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF6B94),
        Color(0xFF6B2E98),
      ],
    ),
    illustration: 'illustration-12.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
  Feature(
    featureTitle: "Swift Advanced",
    featureSubtitle: "Yet to be Certified",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFDEC8FA),
        Color(0xFF4A1B6D),
      ],
    ),
    illustration: 'illustration-13.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
    about: '',
  ),
];
