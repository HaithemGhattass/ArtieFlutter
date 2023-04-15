import 'package:flutter/material.dart';

import 'sidebar_button.dart';

class HomeScreenNavBar extends StatelessWidget {
  HomeScreenNavBar({required this.triggerAnimation});
  final VoidCallback triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SideBarButton(triggerAnimation: triggerAnimation),
          CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}