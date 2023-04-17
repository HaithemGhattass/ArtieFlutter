import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'dart:io';
import '../../AppColors.dart';
import '../../constants.dart';

class ControlScreen extends StatefulWidget {
  ControlScreen({Key? key}) : super(key: key);
  @override
  _ControlScreen createState() => _ControlScreen();
}

class _ControlScreen extends State<ControlScreen> {
  late MotorController _motorController;
  bool _isConnected = false;
  @override
  void initState() {
    super.initState();
    _motorController = MotorController();
    willAcceptStream = BehaviorSubject<int>();
    willAcceptStream.add(0);
    super.initState();
  }

  Future<void> _connect() async {
    try {
      await _motorController.connect('172.20.10.2', 8003);
      setState(() {
        print('connecting');

        _isConnected = true;
      });
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Could not connect to server');
    }
  }

  Future<void> _armUp() async {
    try {
      await _motorController.sendCommand('armup');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _mouthOpen() async {
    try {
      await _motorController.sendCommand('mouthopen');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _mouthClose() async {
    try {
      await _motorController.sendCommand('mouthclose');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _armDown() async {
    try {
      await _motorController.sendCommand('armdown');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _disconnect() async {
    try {
      _motorController.close();
      setState(() {
        _isConnected = false;
      });
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Could not disconnect');
    }
  }

  Future<void> _sendStartCommand() async {
    try {
      await _motorController.sendCommand('start');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _sendBackCommand() async {
    try {
      await _motorController.sendCommand('back');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _sendRightCommand() async {
    try {
      await _motorController.sendCommand('right');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _sendLeftCommand() async {
    try {
      await _motorController.sendCommand('left');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _sendStopCommand() async {
    try {
      await _motorController.sendCommand('stop');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  double _top = 0;
  double _left = 0;
  Offset _position = Offset.zero;

  late BehaviorSubject<int> willAcceptStream;

  Color background = AppColors.lightBackground;
  Color text = AppColors.lightText;
  Color select = AppColors.lightSelect;
  Color icon = AppColors.lightIcon;
  Color buttonBackground = AppColors.lightButtonBackground;
  Color iconButton = AppColors.lightIconButton;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _fuctionDrag(String msg) {
    final snackBar = SnackBar(
        content: Text('$msg'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 500));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
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
                        InkWell(
                          onTap: () async {
                            print("try to connect");
                            _isConnected == false
                                ? await _connect()
                                : await _disconnect();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            width: size.height * 0.11,
                            height: size.height * 0.11,
                            decoration: BoxDecoration(
                              color: buttonBackground,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.power_settings_new,
                              color: Color(0xFFEF5252),
                              size: 38,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                width: size.width * 0.20,
                                height: size.height * 0.25,
                                decoration: BoxDecoration(
                                  color: buttonBackground,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () async {
                                        _mouthOpen();
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_up,
                                        color: iconButton,
                                        size: 38,
                                      ),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: text,
                                        fontSize: 24,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        _mouthClose();
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: iconButton,
                                        size: 38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width * 0.20,
                                height: size.height * 0.25,
                                decoration: BoxDecoration(
                                  color: buttonBackground,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(40.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () async {
                                        _armUp();
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_up,
                                        color: iconButton,
                                        size: 38,
                                      ),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: text,
                                        fontSize: 24,
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          _armDown();
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: iconButton,
                                          size: 38,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(children: [
                            DragTarget(
                              builder: (context, list, list2) {
                                return Container(
                                  padding: const EdgeInsets.all(3),
                                  width: size.width * 0.2,
                                  height: size.width * 0.3,
                                  child: const Icon(
                                    Icons.lens,
                                    color: Color(0xFFFF4B4D),
                                    size: 18,
                                  ),
                                );
                              },
                              onWillAccept: (item) {
                                debugPrint('top');
                                _sendStartCommand();
                                this.willAcceptStream.add(100);
                                _fuctionDrag('top');
                                return false;
                              },
                              onLeave: (item) {
                                debugPrint('RESET');
                                _sendStopCommand();
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
                                    padding: const EdgeInsets.all(3),
                                    width: size.width * 0.2,
                                    height: size.width * 0.5,
                                    child: const Icon(
                                      Icons.lens,
                                      color: Color(0xFFFF4B4D),
                                      size: 18,
                                    ),
                                  );
                                },
                                onWillAccept: (item) {
                                  debugPrint('left');
                                  _sendLeftCommand();
                                  this.willAcceptStream.add(-50);
                                  _fuctionDrag('left');
                                  return false;
                                },
                                onLeave: (item) {
                                  debugPrint('RESET');
                                  _sendStopCommand();
                                  this.willAcceptStream.add(0);
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.all(2.5),
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
                                  padding: const EdgeInsets.all(18),
                                  width: size.width * 0.4,
                                  height: size.width * 0.4,
                                  decoration: const BoxDecoration(
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
                                                      ? const Color(0xFF59C533)
                                                      : (snapshot.data) == 0
                                                          ? buttonBackground
                                                          : const Color(
                                                              0xFFFF4B4D),
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
                                    padding: const EdgeInsets.all(3),
                                    width: size.width * 0.2,
                                    height: size.width * 0.5,
                                    child: const Icon(
                                      Icons.lens,
                                      color: Color(0xFFFF4B4D),
                                      size: 18,
                                    ),
                                  );
                                },
                                onWillAccept: (item) {
                                  debugPrint('right');
                                  _sendRightCommand();
                                  this.willAcceptStream.add(50);
                                  _fuctionDrag('right');
                                  return false;
                                },
                                onLeave: (item) {
                                  debugPrint('RESET');
                                  _sendStopCommand();
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
                                  padding: const EdgeInsets.all(3),
                                  width: size.width * 0.2,
                                  height: size.width * 0.3,
                                  child: const Icon(
                                    Icons.lens,
                                    color: Color(0xFFFF4B4D),
                                    size: 18,
                                  ),
                                );
                              },
                              onWillAccept: (item) {
                                debugPrint('bottom');
                                _sendBackCommand();
                                this.willAcceptStream.add(-100);
                                _fuctionDrag("buttom");
                                return false;
                              },
                              onLeave: (item) {
                                debugPrint('RESET');
                                _sendStopCommand();
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

class MotorController {
  late Socket socket;

  Future<void> connect(String host, int port) async {
    socket = await Socket.connect(host, port);
  }

  Future<void> sendCommand(String command) async {
    socket.write(command);
  }

  void close() {
    socket.close();
  }
}
