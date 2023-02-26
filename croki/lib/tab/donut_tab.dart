import 'package:flutter/material.dart';

import '../util/donut_tile.dart';

class DonutTab extends StatelessWidget {
  // list of donuts

  List donutsOnSale = [
    ["ice cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["ice cream", "36", Colors.red, "lib/images/icecream_donut.png"],
    ["ice cream", "36", Colors.purple, "lib/images/icecream_donut.png"],
    ["ice cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: donutsOnSale.length,
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
        ),
        itemBuilder: (context, index) {
          return DonutTile(
            donutFlavour: donutsOnSale[index][0],
            donutPrice: donutsOnSale[index][1],
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
          );
        });
  }
}
