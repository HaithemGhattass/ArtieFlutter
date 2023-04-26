import 'package:artie/constants.dart';
import 'package:artie/model/feature.dart';
import 'package:flutter/material.dart';

class HowTOuseCard extends StatelessWidget {
  HowTOuseCard({super.key, required this.feature});
  final Feature feature;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: feature.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                    color: feature.background.colors[0].withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 20.0,
                  ),
                  BoxShadow(
                    color: feature.background.colors[1].withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 20.0,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41.0),
                child: Container(
                  height: 140.0,
                  width: 260.0,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'asset/illustrations/${feature.illustration}',
                                fit: BoxFit.cover,
                                height: 110,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              feature.featureSubtitle,
                              style: kCardSubtitleStyle,
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              feature.featureTitle,
                              style: kCardTitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 12.5,
              bottom: 13.5,
              left: 20.5,
              right: 14.5,
            ),
          ),
        ],
      ),
    );
  }
}
