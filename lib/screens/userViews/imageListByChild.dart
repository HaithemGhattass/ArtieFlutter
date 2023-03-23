
import 'package:artie/models/image.dart';
import 'package:artie/screens/userViews/addChild.dart';
import 'package:artie/screens/userViews/imagrCard.dart';
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
 
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
     // backgroundColor: Colors.transparent,
 
        
      appBar: AppBar(title: Text('Image List By Child'),backgroundColor: Colors.amber[400],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: _images.map((image) {
                return ImageCard(imageUrl: image.image);
              }).toList(),
            ),
   
          ],
        ),
      ),
    );
  }
}