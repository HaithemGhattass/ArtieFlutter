import 'package:flutter/material.dart';
import 'package:artie/Constants.dart';

import '../model/sidebar.dart';

class SideBarRow extends StatelessWidget {
  SideBarRow({required this.item});
  final SidebarItem item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 42,
            height: 42,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                gradient: item.background),
            child: item.icon),
        const SizedBox(width: 12),
        Container(
          child: Text(
            item.title,
            style: kCalloutLabelStyle,
          ),
        ),
      ],
    );
  }
}
