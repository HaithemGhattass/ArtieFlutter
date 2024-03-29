import 'dart:io';

import 'package:artie/components/cards/ImageByAgeCard.dart';
import 'package:artie/constants.dart';
import 'package:artie/models/child.dart';
import 'package:artie/models/image%20copy.dart';
import 'package:artie/screens/editProfile_screen.dart';
import 'package:artie/screens/home_screen.dart';
import 'package:artie/service/imageAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../service/childapi_service.dart';
import 'addchild_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _name;
  late Future<String> _email;
  late String random;

  Future<String> _getname() async {
    final SharedPreferences prefs = await _prefs;
    final String name = (prefs.getString('name') ?? '');

    return name;
  }

  Future<String> _getemail() async {
    final SharedPreferences prefs = await _prefs;
    final String name = (prefs.getString('email') ?? '');

    return name;
  }
    List<Imagee> _images = [];

  void updateImages() {
    _loadImages();
  }

  void _loadImages() async {
    final List<Imagee> imageByAges = await ImageApiService.getImagesByAgeChild();
    setState(() {
      _images = imageByAges;
    });
   // print(_images);
  }
  List<Child> _childs = [];
  @override
  void initState() {
    super.initState();
    _loadChilds();
    _name = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('name') ?? '';
    });
    _email = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('email') ?? '';
    });
    random = '';
  }

  void updateChilds() {
    _loadChilds();
  }

  void _loadChilds() async {
    final List<Child> childs = await ChildApiService.getChildsByUser();
    print(childs);
    setState(() {
      _childs = childs;
    });
    print(_childs);
  }
  final List<Gradient> gradient = [
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                        //color: kBackgroundColor,

                color: kCardPopupBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(34.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor,
                    offset: Offset(0, 12),
                    blurRadius: 32.0,
                  ),
                ],
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.0,
                        bottom: 32.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawMaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            constraints: BoxConstraints(
                                minWidth: 40.0,
                                maxWidth: 40.0,
                                maxHeight: 24.0),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: kSecondaryLabelColor,
                                ),
                              ],
                            ),
                          ),
                          Text(
                              AppLocalizations.of(context)!.profile,
                            style: kCalloutLabelStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile(),
                                    fullscreenDialog: true),
                              );
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kShadowColor,
                                      offset: Offset(0, 12),
                                      blurRadius: 32.0,
                                    )
                                  ]),
                              child: Icon(
                                Platform.isAndroid
                                    ? Icons.settings
                                    : CupertinoIcons.settings_solid,
                                color: kSecondaryLabelColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          /*   Container(
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                               child: Container(
                                padding: EdgeInsets.all(6.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'http://localhost:9090/img/a.png'),
                                  radius: 30.0,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(42.0),
                                ),
                              ),
                            ),
                            height: 84.0,
                            width: 84.0,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Color(0xFF00AEFF),
                                  Color(0xFF0076FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(42.0),
                            ),
                          ),
                      */
                          SizedBox(width: 16.0),
                          
                          Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Align(),
                               Column(
                                 children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    AppLocalizations.of(context)!.hello,
                                        style:  kLargeTitleStyle,
                                ),
                                  FutureBuilder(
                                future:  _name,
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                    case ConnectionState.waiting:
                                      return const CircularProgressIndicator();
                                    case ConnectionState.active:
                                    case ConnectionState.done:
                                      return Text(
                                        '${snapshot.data}',
                                        style:  kLargeTitleStyle,
                                      );
                                  }
                                },
                              ),
                                ],
                            ),
                            
                            ),]

                               ),
                           
                              SizedBox(height: 8.0),
                             
                              /*FutureBuilder(
                                future: _email,
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                    case ConnectionState.waiting:
                                      return const CircularProgressIndicator();
                                    case ConnectionState.active:
                                    case ConnectionState.done:
                                      return Text(
                                        '${snapshot.data}',
                                        style: kSecondaryCalloutLabelStyle,
                                      );
                                  }
                                },
                              ),*/
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                                                AppLocalizations.of(context)!.createaspecialspaceforyourkids,

                                  
                                        style: kSecondaryCalloutLabelStyle,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddChild();
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "",
                                        style: kSearchPlaceholderStyle,
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: Color.fromARGB(255, 10, 38, 223)
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      
                      height: 112.0,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 28.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: _childs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print(_childs[index].age);
                              setState(() {
                              ImageApiService.age=_childs[index].age;
                               updateImages();
                                random = _childs[index].name;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: index != 3 ? 0.0 : 20.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: kShadowColor.withOpacity(0.1),
                                    offset: Offset(0, 12),
                                    blurRadius: 18.0,
                                  ),
                                ],
                              ),
                                 child:  ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10)),
                    child:Container(    
                       child:   Image.network(
                       Constants.baseUrl+  "/img/"+ _childs[index].image,
                       fit: BoxFit.cover,
                       width: 120,
                       height: 120,
                    )
                    )),
                        
                            ),
                          );
                        },
                      ),
                    ),
                  Padding(
              padding: EdgeInsets.only(
                top: 9.0,
                left: 20.0,
                right: 20.0,
                bottom: 12.0,
              ),
            ),
                 Text(random+"  "+ AppLocalizations.of(context)!.space,

                                  style: kHeadlineLabelStyle,
                                ),
                                  Padding(
              padding: EdgeInsets.only(
                top: 12.0,
                left: 20.0,
                right: 20.0,
                bottom: 12.0,
              ),
            ),
                Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
            child: ImageByAgeCard(
              image: _images[index],
              gradient: gradient[index],
            ),
          );
        },
      ),
    ),
         Padding(
              padding: EdgeInsets.only(
                top: 32.0,
                left: 20.0,
                right: 20.0,
                bottom: 12.0,
              ),
            ),
                  ],
                ),
              ),
         
         
         
         
            ),
       

     



          ],
        ),
      ),
    );
  }
}
