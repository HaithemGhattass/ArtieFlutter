import 'package:artie/components/cards/Gcode_draws_card.dart';
import 'package:artie/model/feature.dart';
import 'package:flutter/material.dart';

class GcodeDraws extends StatelessWidget {
  const GcodeDraws({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: explorefeatures.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
            child: GcodeDrawsCard(feature: explorefeatures[index]),
          );
        },
      ),
    );
  }
}
