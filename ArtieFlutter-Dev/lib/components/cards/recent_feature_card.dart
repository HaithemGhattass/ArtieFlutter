import 'package:artie/constants.dart';
import 'package:artie/model/feature.dart';
import 'package:flutter/material.dart';

class MainCards extends StatelessWidget {
  MainCards({super.key, required this.feature});
  Feature feature;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
                gradient: feature.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                      color: feature.background.colors[0].withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 30.0),
                  BoxShadow(
                      color: feature.background.colors[1].withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 30.0),
                ]),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: feature.featureSubtitle,
                          child: Text(
                            feature.featureSubtitle,
                            style: kCardSubtitleStyle,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Hero(
                          tag: feature.featureTitle,
                          child: Text(
                            feature.featureTitle,
                            style: kCardTitleStyle,
                          ),
                        ),
                      ]),
                ),
                Expanded(
                    child: Hero(
                  tag: feature.illustration,
                  child: Image.asset(
                    'asset/illustrations/${feature.illustration}',
                    fit: BoxFit.cover,
                  ),
                )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 42.0),
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: const [
                BoxShadow(
                    color: kShadowColor,
                    offset: Offset(0, 4),
                    blurRadius: 16.0),
              ],
            ),
            padding: const EdgeInsets.all(12.0),
            child: Image.asset("asset/logos/${feature.logo}"),
          ),
        ),
      ],
    );
  }
}
