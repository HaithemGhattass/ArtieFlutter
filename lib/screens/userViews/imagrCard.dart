import 'package:artie/screens/userViews/imageListByChild.dart';
import 'package:artie/services/server_URL.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ImageCard extends StatelessWidget {
  final String imageUrl;
  final int index; // l'index de l'image dans la liste

  ImageCard({required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    // Define a list of colors to choose from
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.purple,
      Colors.yellow,
    ];
    final colorIndex = index % colors.length; // to cycle between colors

    return InkWell(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.doYouWantToDesignTheImage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // TODO: Ajouter le code pour imprimer l'image ici
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.save, style: TextStyle(color:Color(0xFFF5CEB8),)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(color: Colors.grey )),
            ),
          ],
        );
      },
    );
  },
      child: Card(
        
        child: Container(
          color: colors[colorIndex][50],
          
          child: Column(
            
            children: [
              Image.network(
                Server_URL.baseUrl + '/img/' + imageUrl,
                width: 200,
                height: 140,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
