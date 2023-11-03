import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SidebarItem {
  SidebarItem(
      {required this.title, required this.background, required this.icon});

  String title;
  LinearGradient background;
  Icon icon;
}

var sidebarItem = [
  SidebarItem(
    title: "Profile",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    icon: const Icon(
      Icons.person,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Logout",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFA7d75), Color(0xFFC23D61)]),
    icon: Icon(
      Platform.isAndroid ? Icons.logout : CupertinoIcons.arrow_left_circle_fill,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Billing",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFAD64A), Color(0xFFEA880F)]),
    icon: const Icon(
      Icons.credit_card,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Settings",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF4E62CC), Color(0xFF202A78)],
    ),
    icon: Icon(
      Platform.isAndroid ? Icons.settings : CupertinoIcons.settings_solid,
      color: Colors.white,
    ),
  ),
];
