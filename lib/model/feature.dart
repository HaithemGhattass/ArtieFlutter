import 'package:flutter/material.dart';

class Feature {
  Feature(
      {required this.featureTitle,
      required this.featureSubtitle,
      required this.background,
      required this.illustration,
      required this.logo,
      required this.intro,
      required this.view});
  String intro;
  String featureTitle;
  String featureSubtitle;
  LinearGradient background;
  String illustration;
  String logo;
  Widget view;
}

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
      illustration: 'illustration-01.png',
      logo: 'flutter-logo.png',
      intro: 'badel lena 1',
      view: Container(
        child: Text('loula'),
      )),
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
    illustration: 'illustration-02.png',
    logo: 'protopie-logo.png',
    intro: 'badel lena 2',
    view: Container(child: Text('thenia')),
  ),
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
    illustration: 'illustration-03.png',
    logo: 'swift-logo.png',
    intro: 'badel lena 3',
    view: Container(child: Text('theltha')),
  ),
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
  ),
];

// Continue Watching features
var continueWatchingfeatures = [
  Feature(
    featureTitle: "React for Designers",
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
  ),
  Feature(
    featureTitle: "Animating in Principle",
    featureSubtitle: "Multiple Scrolling",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7D75),
        Color(0xFFC23D61),
      ],
    ),
    illustration: 'illustration-07.png',
    logo: 'flutter-logo.png',
    intro: '',
    view: Container(),
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
  ),
];
