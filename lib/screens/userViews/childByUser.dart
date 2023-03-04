import 'package:artie/models/child.dart';
import 'package:artie/models/user.dart';
import 'package:artie/screens/userViews/addChild.dart';
import 'package:artie/services/childAPI.dart';
import 'package:artie/services/userAPI.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: _childs.map((child) {
                return UserCard(imageUrl: child.image,name:child.name);
              }).toList(),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AddChild();
          },
        );
      },
                child: Text('Add Child'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}