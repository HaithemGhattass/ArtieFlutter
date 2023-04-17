import 'package:artie/Constants.dart';
import 'package:artie/model/feature.dart';
import 'package:artie/models/image.dart';
import 'package:flutter/material.dart';

class GcodeDrawsCard extends StatelessWidget {
  const GcodeDrawsCard(
      {super.key, required this.feature, required this.gradient});

  final Draw feature;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(gradient: gradient),
          child: Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.0),
                      Text(
                        'Future pictures to draw',
                        style: kCardTitleStyle,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(
                      'http://localhost:9090/img/${feature.image}',
                      fit: BoxFit.cover,
                      height: 100,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
