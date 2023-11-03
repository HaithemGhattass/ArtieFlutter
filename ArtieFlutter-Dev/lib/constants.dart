import 'dart:io';
import 'package:flutter/material.dart';

// Colors
const kBackgroundColor = Color(0xFFE7EEFB);
const kSidebarBackgroundColor = Color(0xFFF1F4FB);
const kCardPopupBackgroundColor = Color(0xFFF5F8FF);
const kPrimaryLabelColor = Color(0xFF242629);
const kSecondaryLabelColor = Color(0xFF797F8A);
const kShadowColor = Color.fromRGBO(72, 76, 82, 0.16);
const kCourseElementIconColor = Color(0xFF17294D);

// Text Styles
var kLargeTitleStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kTitle1Style = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kCardTitleStyle = TextStyle(
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 22.0,
  decoration: TextDecoration.none,
);
var kTitle2Style = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kHeadlineLabelStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColor,
  fontFamily: 'SF Pro Text',
  decoration: TextDecoration.none,
);
var kSubtitleStyle = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kBodyLabelStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.black,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kCalloutLabelStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kSecondaryCalloutLabelStyle = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kSearchPlaceholderStyle = TextStyle(
  fontSize: 13.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kSearchTextStyle = TextStyle(
  fontSize: 13.0,
  color: kPrimaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);
var kCardSubtitleStyle = TextStyle(
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  color: Color(0xE6FFFFFF),
  fontSize: 13.0,
  decoration: TextDecoration.none,
);
var kCaptionLabelStyle = TextStyle(
  fontSize: 12.0,
  color: kSecondaryLabelColor,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
);

class Constants {
  // Constant Color
  static const Color kPinkColor = Color(0xFFFE53BB);
  static const Color kCyanColor = Color(0xFF08F7FE);
  static const Color kGreenColor = Color(0xFF09FBD3);
  static const Color kBlackColor = Color(0xFF19191B);
  static const Color kYellowColor = Color(0xFFF2A33A);
  static const Color kWhiteColor = Color(0xFFFFFFFF);
  static const Color kGreyColor = Color(0xFF767680);

  // Constant Icon
  static const String kIconHome = 'assets/svg/icon-home.svg';
  static const String kIconPlayOnTv = 'assets/svg/icon-playtv.svg';
  static const String kIconPlus = 'assets/svg/icon-plus.svg';
  static const String kIconCategories = 'assets/svg/icon-categories.svg';
  static const String kIconDownload = 'assets/svg/icon-download.svg';
  static const String kIconSearch = 'assets/svg/icon-search.svg';
  static const String kIconMic = 'assets/svg/icon-mic.svg';
  static const String kIconPlay = 'assets/svg/icon-play.svg';
  static const String kIconBack = 'assets/svg/icon-back.svg';
  static const String kIconMenu = 'assets/svg/icon-menu.svg';

  // Constant Mask
  static const String kMaskFirstIndex = 'assets/mask/mask_firstIndex.png';
  static const String kMaskLastIndex = 'assets/mask/mask_lastIndex.png';
  static const String kMaskCenter = 'assets/mask/mask.png';
  static const String kMaskCast = 'assets/mask/mask_cast.png';

  // Constant Server
  static const String baseUrl = 'http://localhost:9090';
}
