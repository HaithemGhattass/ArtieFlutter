import 'package:flutter/material.dart';
import 'dart:math';

import '../util/donut_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonutTab extends StatelessWidget {
  // list of donuts
 List colors = [Color.fromARGB(255, 152, 233, 106), Colors.blue, Colors.yellow,Color.fromARGB(255, 236, 172, 52)];
  Random random = Random();

  int index = 0;    

  List imagesUrl = [];
 
 
  List<GameData> games = [];
  late Future<bool> fetchedGames;
  final String baseUrl = "192.168.1.79:9090";
  Future<bool> fetchGames() async {
    http.Response response = await http.get(Uri.http(baseUrl, "/image"));
    List<dynamic> gamesFromServer = json.decode(response.body);
    gamesFromServer.forEach((game) {
      games.add(GameData(
          childAge: int.parse(game["childAge"].toString()),
          image: game["image"], 
          color:colors[random.nextInt(4)], 
          colorMe: 'Color me',
         ));
    });
    return true;
  }
  


  

  @override
  Widget build(BuildContext context) {
    fetchedGames = fetchGames();
     return FutureBuilder(
        future: fetchedGames,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

    return GridView.builder(
        itemCount: games.length,
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
        ),
        itemBuilder: (context, index) {
          return DonutTile(
            
            
            game: games[index],
          ); 
        });}
        else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

        }
     );
  } 
  
}
class GameData {
  
  final String image;
  final Color color;
  final String colorMe;
  final int childAge;
  GameData({
    required this.childAge,
    required this.image,
    required this.colorMe,
    required this.color,
    
    
  });
}