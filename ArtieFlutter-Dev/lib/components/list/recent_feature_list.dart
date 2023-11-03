import 'package:artie/components/cards/recent_feature_card.dart';
import 'package:artie/model/feature.dart';
import 'package:artie/screens/draw_screen.dart';
import 'package:artie/screens/feature_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MainCardsList extends StatefulWidget {
  const MainCardsList({super.key});

  @override
  State<MainCardsList> createState() => _MainCardsListState();
}

class _MainCardsListState extends State<MainCardsList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget UpdateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentfeatures.map((feature) {
        var index = recentfeatures.indexOf(feature);
        return Container(
          width: 7.0,
          height: 7.0,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentPage == index ? Color(0xFF0971FE) : Color(0xFFA6AEBD)),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FeatureScreen(
                              feature:  Feature(
      featureTitle:                           AppLocalizations.of(context)!.learntocoloranddraw,
      featureSubtitle:     AppLocalizations.of(context)!.learning,
      background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF00AEFF),
          Color(0xFF0076FF),
        ],
      ),
      illustration: 'drawingnobg1.png',
      logo: 'logo2.png',
      intro:AppLocalizations.of(context)!.learntocoloranddrawwithArtie, 
      view: Container(child: ColorGame()),
      about:AppLocalizations.of(context)!.exploredifferentshapesandcolorsYouarepresentedwithaseriesofshapesandyoumustchoosethecorrectonetoprogresstothenextlevelOnceyouhaveselectedthecorrectshapeArtiebeginstodrawitonthescreenYouwillneedtorepeatthisprocesswithalltheshapesuntilthedrawingis),
                            ),
                        fullscreenDialog: true),
                  );
                },
                child: Opacity(
                  opacity: currentPage == index ? 1.0 : 0.5,
                  child: MainCards(
                    feature: recentfeatures[index],
                  ),
                ),
              );
            },
            itemCount: recentfeatures.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.63),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        UpdateIndicators(),
      ],
    );
  }
}
