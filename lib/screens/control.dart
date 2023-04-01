import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../AppColors.dart';
import '../constants.dart';

class ControlScreen extends StatefulWidget {
  ControlScreen({Key? key}) : super(key: key);
  @override
  _ControlScreen createState() => _ControlScreen();
}

class _ControlScreen extends State<ControlScreen> {
  double _top = 0;
  double _left = 0;
  Offset _position = Offset.zero;

  late BehaviorSubject<int> willAcceptStream;

  Color background = AppColors.darkBackground;
  Color text = AppColors.darkext;
  Color select = AppColors.darkSelect;
  Color icon = AppColors.lightIcon;
  Color buttonBackground = AppColors.darkButtonBackground;
  Color iconButton = AppColors.darkIconButton;

  @override
  void initState() {
    willAcceptStream = new BehaviorSubject<int>();
    willAcceptStream.add(0);
    super.initState();
  }

  void _fuctionDrag(String msg) {
    final snackBar = SnackBar(
        content: Text('$msg'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 500));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              child: Container(
                width: size.width,
                height: size.height,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: Row(children: [
                            DragTarget(
                              builder: (context, list, list2) {
                                return Container(
                                  padding: EdgeInsets.all(3),
                                  width: size.width * 0.2,
                                  height: size.width * 0.3,
                                  child: Icon(
                                    Icons.lens,
                                    color: Color(0xFFFF4B4D),
                                    size: 18,
                                  ),
                                );
                              },
                              onWillAccept: (item) {
                                debugPrint('top');
                                this.willAcceptStream.add(100);
                                _fuctionDrag('top');
                                return false;
                              },
                              onLeave: (item) {
                                debugPrint('RESET');
                                this.willAcceptStream.add(0);
                              },
                            ),
                          ]),
                        ),
                        Container(
                          width: size.width,
                          height: size.height * 0.23,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              DragTarget(
                                builder: (context, list, list2) {
                                  return Container(
                                    padding: EdgeInsets.all(3),
                                    width: size.width * 0.2,
                                    height: size.width * 0.5,
                                    child: Icon(
                                      Icons.lens,
                                      color: Color(0xFFFF4B4D),
                                      size: 18,
                                    ),
                                  );
                                },
                                onWillAccept: (item) {
                                  debugPrint('left');
                                  this.willAcceptStream.add(-50);
                                  _fuctionDrag('left');
                                  return false;
                                },
                                onLeave: (item) {
                                  debugPrint('RESET');
                                  this.willAcceptStream.add(0);
                                },
                              ),
                              Container(
                                padding: EdgeInsets.all(2.5),
                                width: size.width * 0.5,
                                height: size.width * 0.5,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.pinkAccent,
                                      Colors.blue,
                                      Color(0xFF584BD2)
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(18),
                                  width: size.width * 0.4,
                                  height: size.width * 0.4,
                                  decoration: new BoxDecoration(
                                    color: Constants.kBlackColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: GestureDetector(
                                      onPanUpdate: (DragUpdateDetails details) {
                                        setState(() {
                                          _top += details.delta.dy;
                                          _left += details.delta.dx;
                                        });
                                      },
                                      child: Positioned(
                                        top: _top,
                                        left: _left,
                                        child: Draggable<Widget>(
                                          /* dragAnchorStrategy:
                                      (draggable, context, offset) => offset,
                                  onDragUpdate: (details) {
                                    setState(() {
                                      // Calculate the new position of the Draggable widget
                                      _position += details.delta;

                                      // Limit the position to the boundaries of the screen
                                      _position = Offset(
                                        _position.dx.clamp(
                                            0,
                                            MediaQuery.of(context).size.width -
                                                100),
                                        _position.dy.clamp(
                                            0,
                                            MediaQuery.of(context).size.height -
                                                100),
                                      );
                                    });
                                  },
                                  */
                                          feedback: StreamBuilder(
                                            initialData: 0,
                                            stream: willAcceptStream,
                                            builder: (context, snapshot) {
                                              return Container(
                                                width: size.width * 0.4,
                                                height: size.width * 0.4,
                                                decoration: BoxDecoration(
                                                  color: (snapshot.data) != 0
                                                      ? Color(0xFF59C533)
                                                      : (snapshot.data) == 0
                                                          ? buttonBackground
                                                          : Color(0xFFFF4B4D),
                                                  shape: BoxShape.circle,
                                                ),
                                              );
                                            },
                                          ),
                                          child: Container(
                                            width: size.width * 0.4,
                                            height: size.width * 0.4,
                                            decoration: BoxDecoration(
                                              color: buttonBackground,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              DragTarget(
                                builder: (context, list, list2) {
                                  return Container(
                                    padding: EdgeInsets.all(3),
                                    width: size.width * 0.2,
                                    height: size.width * 0.5,
                                    child: Icon(
                                      Icons.lens,
                                      color: Color(0xFFFF4B4D),
                                      size: 18,
                                    ),
                                  );
                                },
                                onWillAccept: (item) {
                                  debugPrint('right');
                                  this.willAcceptStream.add(50);
                                  _fuctionDrag('right');
                                  return false;
                                },
                                onLeave: (item) {
                                  debugPrint('RESET');
                                  this.willAcceptStream.add(0);
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(children: [
                            DragTarget(
                              builder: (context, list, list2) {
                                return Container(
                                  padding: EdgeInsets.all(3),
                                  width: size.width * 0.2,
                                  height: size.width * 0.3,
                                  child: Icon(
                                    Icons.lens,
                                    color: Color(0xFFFF4B4D),
                                    size: 18,
                                  ),
                                );
                              },
                              onWillAccept: (item) {
                                debugPrint('bottom');
                                this.willAcceptStream.add(-100);
                                _fuctionDrag("buttom");
                                return false;
                              },
                              onLeave: (item) {
                                debugPrint('RESET');
                                this.willAcceptStream.add(0);
                              },
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
