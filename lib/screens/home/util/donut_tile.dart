import 'package:flutter/material.dart';
import 'package:artie_flutter/screens/home/tab/donut_tab.dart';

class DonutTile extends StatelessWidget {
  
  
  
  
   final GameData game;
  final String baseUrl = "192.168.1.79:9090";

  final double borderRadius = 12;
  const DonutTile(
      {super.key,
     
      
      required this.game});
      

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: game.color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Column(
            children: [
              //price
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    decoration: BoxDecoration(
                        color: game.color,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            topRight: Radius.circular(borderRadius))),
                    padding: EdgeInsets.all(8),
                    child: Text(game.childAge.toString()
                      ,
                      style: TextStyle(
                          color: game.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ))
              ]),
              //donut picture
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 36.0, vertical: 12),
                  child: Image.network("http://$baseUrl/img/${game.image}")),

              //donut flavor
              Text(game.colorMe,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              const SizedBox(height: 4),
              
              const SizedBox(height: 12),
              //love icon + add button
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.pink[400],
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}