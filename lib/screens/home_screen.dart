import 'dart:ui';

import 'package:artie/components/child_item.dart';
import 'package:artie/screens/addChild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:artie/components/masked_image.dart';
import 'package:artie/components/search_field_widget.dart';
import 'package:artie/models/movie.dart';

import '../constants.dart';
import '../models/child.dart';
import '../services/ChildApi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    print(_childs);
  }

  void updateChilds() {
    _loadChilds();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kCyanColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                   Text(
                     AppLocalizations.of(context)!.whatwouldyouliketocolor,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SearchFieldWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 39,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Text(
                             AppLocalizations.of(context)!.craeteSpace,
                            style: TextStyle(
                              color: Constants.kWhiteColor,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 250,
                            height: 10,
                          ),
                          Container(
                            height: 64,
                            width: 64,
                            padding: const EdgeInsets.all(4),
                            margin: const EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Constants.kPinkColor.withOpacity(0.2),
                                  Constants.kGreenColor.withOpacity(0.2)
                                ],
                              ),
                            ),
                            child: Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Constants.kPinkColor,
                                    Constants.kGreenColor,
                                  ],
                                ),
                              ),
                              child: RawMaterialButton(
                                onPressed: () {
                                  showDialog(
          context: context,
          builder: (BuildContext context) {
            return AddChild();
          },
        );
      
                                },
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff404c57),
                                child: SvgPicture.asset(Constants.kIconPlus),
                              ),
                            ),
                          ),
                        ],
                      )),
                  
                  const SizedBox(
                    height: 37,
                  ),
             SizedBox(
  height: 160,
  child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: _childs.length,
    itemBuilder: (context, index) {
      String mask;
       // mask = Constants.kMaskCenter;
      if (index == 0) {
        mask = Constants.kMaskFirstIndex;
      } else if (index == _childs.length - 1) {
        mask = Constants.kMaskLastIndex;
      } else {
        mask = Constants.kMaskCenter;
      }
            return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(
            left: index == 0 ? 20 : 0,
          ),
          height: 160,
          width: 142,
          child: 
          //ListView(
           // scrollDirection: Axis.horizontal,
           // children: _childs.map((child) {
            //  print("child image here ::"+child.image);
            //  print('child image here');
          //    return 
              ChildItem(
                asset: _childs[index].image,
                mask: mask,
             // );
              ),
          //  }).toList(),
        //  ),
        ),
      );
    },
  ),
),

                  const SizedBox(
                    height: 38,
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      AppLocalizations.of(context)!.complexdraws,
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: upcomingMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        print(index);
                        if (index == 0) {
                          mask = Constants.kMaskFirstIndex;
                        } else if (index == upcomingMovies.length - 1) {
                          mask = Constants.kMaskLastIndex;
                        } else {
                          mask = Constants.kMaskCenter;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                            ),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                              asset: upcomingMovies[index].moviePoster,
                              mask: mask,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2)
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(Constants.kIconMenu),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 92,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kWhiteColor.withOpacity(0.1),
            Constants.kWhiteColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconHome,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/control");
                  },
                  icon: SvgPicture.asset(
                    Constants.kIconPlayOnTv,
                  ),
                ),
              ),
              const Expanded(
                child: Text(''),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/draw");
                  },
                  icon: SvgPicture.asset(
                    Constants.kIconCategories,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconDownload,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
