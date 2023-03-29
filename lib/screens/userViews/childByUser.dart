import 'package:artie/models/child.dart';
import 'package:artie/screens/userViews/addChild.dart';
import 'package:artie/services/childAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'childCard.dart';


class ChildByUser extends StatefulWidget {
 //  final void Function() onUpdateChilds;

 // ChildByUser({required this.onUpdateChilds});
   
  @override
  _ChildByUserState createState() => _ChildByUserState();
}

class _ChildByUserState extends State<ChildByUser> {
  List<Child> _childs = [];

  @override
  void initState() {
    super.initState();
 _loadChilds();

  }

   void _loadChilds() async {
    final List<Child> childs = await ChildApiService.getChildsByUser();
    print(childs);
    setState(() {
      _childs = childs;
    });
  }
   void updateChilds() {
    _loadChilds();
  }
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
     
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                  
                    //  child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Good Mornign",
                    //style: Theme.of(context)
                       // .textTheme
                        //.copyWith(fontWeight: FontWeight.w900),
                  ),
Align(
    alignment: Alignment.bottomRight,
  child:Container (alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ), child:  IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AddChild();
          },
        );
      },
      icon: Icon(Icons.add),
    ),
  ),
),



               Expanded(
  flex: 1, // définir la flexibilité
  child: SizedBox(
    height: 200, // définir la hauteur fixe
    child: GridView.count(
      crossAxisCount: 1,
       childAspectRatio: 1.8,
      children: _childs.map((child) {
        return UserCard(imageUrl: child.image,name:child.name,age:child.age);
      }).toList(),
    ),
  ),
),

                ],
              ),
            ),
          )
       
        ],
     
      ),
    );
  }
  }

