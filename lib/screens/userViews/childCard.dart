
import 'package:artie/constants.dart';
import 'package:artie/screens/userViews/imageListByChild.dart';
import 'package:artie/services/imageAPI.dart';
import 'package:artie/services/server_URL.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String name;
 final num age;
  UserCard({required this.imageUrl, required this.name, required this.age});

@override
Widget build(BuildContext context) {
  return InkWell(
onTap: () {
      ImageApiService.age=age;
      //ImageApiService.getImagesByAgeChild();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageListByChild()),
      );
    },
    child: Container(
         margin: EdgeInsets.only(top: 20),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white,),
       
      child: Stack(
        children: [
          ClipRRect(
           borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
child: Container(
           margin: EdgeInsets.only(top: 20),

 child:  Image.network(
            Server_URL.baseUrl+'/img/' + imageUrl,
            width: 150,
            height: 125,
            fit: BoxFit.contain,
          ), ),
          ),
        Expanded(child: Container(
  padding:EdgeInsets.all(15),
                 // Text(name),
child: Column(crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Row(mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Text("Age $age",style: TextStyle(fontSize: 10,color:Colors.grey),
    )
  ],
  
  
  ),
 SizedBox(height: 5),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 150), // ajuster la valeur selon votre besoin
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[850]),
            ),
          ),
        ),

],


),
 
                    
        )
      

        )
        ],
      ),
   ),
  );
}
}



