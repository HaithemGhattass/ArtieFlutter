import 'package:artie/components/cards/info_viewer.dart';
import 'package:artie/components/list/howToUse_list.dart';
import 'package:artie/constants.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(34.0)),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(color: kShadowColor, offset: Offset(0, -12), blurRadius: 36.0)
      ],
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 16.0),
              child: Container(
                width: 42.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFC5CBD6),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "How to use Artie Features",
              style: kTitle2Style,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: HowToUseList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "More ...",
              style: kTitle2Style,
            ),
          ),
          Expanded(child: InfoViewer()),
        ],
      ),
    );
  }
}
