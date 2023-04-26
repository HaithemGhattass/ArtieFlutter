import 'package:artie/components/cards/HowToUse_card.dart';
import 'package:artie/model/feature.dart';
import 'package:flutter/material.dart';

class HowToUseList extends StatefulWidget {
  @override
  _HowToUseListState createState() => _HowToUseListState();
}

class _HowToUseListState extends State<HowToUseList> {
  List<Container> indicators = [];
  int currentPage = 0;
  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: continueWatchingfeatures.map((feature) {
        var index = continueWatchingfeatures.indexOf(feature);
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
          height: 200.0,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Opacity(
                opacity: currentPage == index ? 1.0 : 0.5,
                child: HowTOuseCard(
                  feature: continueWatchingfeatures[index],
                ),
              );
            },
            itemCount: continueWatchingfeatures.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}
