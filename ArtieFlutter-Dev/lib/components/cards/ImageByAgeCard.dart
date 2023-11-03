import 'package:artie/Constants.dart';
import 'package:artie/model/feature.dart';
import 'package:artie/models/child.dart';
import 'package:artie/models/image%20copy.dart';
import 'package:artie/models/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImageByAgeCard extends StatelessWidget {
  const ImageByAgeCard(
      {super.key, required this.image, required this.gradient});

  final Imagee image;
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
                          AppLocalizations.of(context)!.futurepicturestodraw,
                        style: kCardTitleStyle,
                      )
                    ],
                  ),
                ),
                Column(                  
                  children: [
                    ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                    child:Container(    
                       child:   Image.network(
                      Constants.baseUrl+'/img/${image.image}',
                      fit: BoxFit.cover,
                       width: 120,
                       height: 120,
                    )
                    )),

                
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
