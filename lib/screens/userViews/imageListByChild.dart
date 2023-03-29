
import 'package:artie/models/image.dart';
import 'package:artie/screens/userViews/addChild.dart';
import 'package:artie/screens/userViews/imagrCard.dart';
import 'package:artie/screens/userViews/my_tab.dart';
import 'package:artie/services/imageAPI.dart';
import 'package:flutter/material.dart';

import 'childCard.dart';


class ImageListByChild extends StatefulWidget {
 //  final void Function() onUpdateChilds;

 // ChildByUser({required this.onUpdateChilds});
   
  @override
  _ImageListByChildState createState() => _ImageListByChildState();
}

class _ImageListByChildState extends State<ImageListByChild> {
  List<Imagee> _images = [];

  @override
  void initState() {
    super.initState();
 _loadImages();

  }

   void _loadImages() async {
    final List<Imagee> images = await ImageApiService.getImagesByAgeChild();
    print(images);
    setState(() {
      _images = images;
    });
  }
   void updateImages() {
    _loadImages();
  }
    // my tabs
  List<Widget> myTabs = const [
    // donut tab
    MyTab(
      iconPath: 'lib/icons/donut.png',
    ),

    // burger tab
    MyTab(
      iconPath: 'lib/icons/burger.png',
    ),

    // smoothie tab
    MyTab(
      iconPath: 'lib/icons/smoothie.png',
    ),

    // pancake tab
    MyTab(
      iconPath: 'lib/icons/pancakes.png',
    ),

    // pizza tab
    MyTab(
      iconPath: 'lib/icons/pizza.png',
    ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
     // backgroundColor: Colors.transparent,
 
        
      appBar: AppBar(title: Text('Image List By Child'),backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.black),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: _images.map((image) {
                  int index = _images.indexOf(image);

                return ImageCard(imageUrl: image.image,index:index );
              }).toList(),
            ),
   
          ],
        ),
      ),
    );
  }
}