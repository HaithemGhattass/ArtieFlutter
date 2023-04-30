import 'package:artie/components/cards/info_viewer.dart';
import 'package:artie/components/list/howToUse_list.dart';
import 'package:artie/constants.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HowToUseScreen extends StatefulWidget {
  const HowToUseScreen({super.key});

  @override
  State<HowToUseScreen> createState() => _HowToUseScreenState();
}

class _HowToUseScreenState extends State<HowToUseScreen> {
  late String howto;
  late bool tapped;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    howto = 'select something ..';
    tapped = false;
  }

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
              AppLocalizations.of(context).howtouseArtieFeatures,
              style: kTitle2Style,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (tapped) {
                      howto = 'select something ...';
                      tapped = false;
                    } else {
                      tapped = true;
                      howto =
                          'To use Artie the drawing robot, first ensure that it is fully charged. Once charged, place Artie in the center of the page you wish to draw on. It is important to ensure that the robot is centered as this will ensure the best results. Once the robot is in position, turn it on and select the desired drawing mode . It is important to note that if the robot is not charged properly, it may encounter problems during the drawing process. Therefore, always make sure to charge the robot fully before using it.';
                    }
                  });
                },
                child: HowToUseList()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              howto,
              style: kTitle2Style,
            ),
          ),
          Expanded(child: InfoViewer()),
        ],
      ),
    );
  }
}
