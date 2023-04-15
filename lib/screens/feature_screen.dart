import 'dart:io';

import 'package:artie/constants.dart';
import 'package:artie/model/feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeatureScreen extends StatefulWidget {
  FeatureScreen({required this.feature});

  final Feature feature;

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration:
                          BoxDecoration(gradient: widget.feature.background),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(18.0)),
                                    child: Image.asset(
                                        'asset/logos/${widget.feature.logo}'),
                                  ),
                                  SizedBox(width: 20.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: widget.feature.featureSubtitle,
                                          child: Text(
                                            widget.feature.featureSubtitle,
                                            style: kSecondaryCalloutLabelStyle
                                                .copyWith(
                                                    color: Colors.white70),
                                          ),
                                        ),
                                        Hero(
                                          tag: widget.feature.featureTitle,
                                          child: Text(
                                            widget.feature.featureTitle,
                                            style: kLargeTitleStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 36.0,
                                      height: 36.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color:
                                            kPrimaryLabelColor.withOpacity(0.8),
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 28.0,
                            ),
                            Expanded(
                                child: Hero(
                              tag: widget.feature.illustration,
                              child: Image.asset(
                                'asset/illustrations/${widget.feature.illustration}',
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 28.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 12.5, bottom: 13.5, left: 20.5, right: 14.5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: kShadowColor,
                            blurRadius: 16.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      width: 60.0,
                      height: 60.0,
                      child: Image.asset('asset/icons/icon-play.png'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 12.0,
                  left: 28.0,
                  right: 28.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Container(
                          padding: EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            child: Icon(
                              Platform.isAndroid
                                  ? Icons.people
                                  : CupertinoIcons.group_solid,
                              color: Colors.white,
                            ),
                            radius: 21.0,
                            backgroundColor: kCourseElementIconColor,
                          ),
                          decoration: BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.circular(29.0)),
                        ),
                      ),
                      height: 58.0,
                      width: 58.0,
                      decoration: BoxDecoration(
                          gradient: widget.feature.background,
                          borderRadius: BorderRadius.circular(29.0)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
