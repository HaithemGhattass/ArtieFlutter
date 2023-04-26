import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:artie/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/rxdart.dart';

import '../constants.dart';

class ColorGame extends StatefulWidget {
  const ColorGame({super.key});

  @override
  State<ColorGame> createState() => _ColorGameState();
}

class _ColorGameState extends State<ColorGame> {
  @override
  final Map<String, bool> score = {'a': true};
  late MotorController _motorController;
  bool _isConnected = false;
  int step = 0;

  @override
  void initState() {
    super.initState();
    _motorController = MotorController();
    willAcceptStream = BehaviorSubject<int>();
    willAcceptStream.add(0);
    _connect();
    // call your function here
  }

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

  Future<void> _sendSquareCommand() async {
    try {
      await _motorController.sendCommand('square');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _sendTriangleCommand() async {
    try {
      await _motorController.sendCommand('triangle');
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Error sending command');
    }
  }

  Future<void> _connect() async {
    try {
      await _motorController.connect('172.20.10.2', 8003);
      setState(() {
        print('connecting to draw');

        _isConnected = true;
      });
    } on SocketException catch (e) {
      print(e);
      _showErrorDialog('Could not connect to server');
    }
  }

  late BehaviorSubject<int> willAcceptStream;

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

  final Map finall = {
    'f': AssetImage('asset/dar.png'),
  };
  final Map choices1 = {
    '▢': AssetImage('asset/sq.png'),
  };
  final Map choices2 = {
    '△': AssetImage('asset/tr.png'),
  };
  final Map choices = {
    '△': AssetImage('asset/tr.png'),
    '〇': AssetImage('asset/outline1.png'),
    '▢': AssetImage('asset/sq.png'),
  };
  int seed = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.refresh),
        backgroundColor: Color(0xff6750a4),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
            step = 0;
          });
        },
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
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
            top: MediaQuery.of(context).size.height * 0.4,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Draw a house',
                ),
                step == 2
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: finall.keys
                            .take(1)
                            .map((emoji) => _buildDragtarget3(emoji))
                            .toList())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: step == 0
                            ? choices1.keys
                                .take(1)
                                .map((emoji) => _buildDragtarget(emoji))
                                .toList()
                            : choices2.keys
                                .take(1)
                                .map((emoji) => _buildDragtarget2(emoji))
                                .toList()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: choices.keys.map((emoji) {
                    return Draggable<String>(
                      data: emoji,
                      child: Emoji(emoji: score[emoji] == true ? '✔️' : emoji),
                      feedback: Emoji(emoji: emoji),
                      childWhenDragging: Emoji(emoji: emoji),
                    );
                  }).toList()
                    ..shuffle(),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildDragtarget(emoji) {
    return DragTarget<String>(
      builder: (context, incoming, rejected) {
        return Image(
          image: choices[emoji],
          width: 300,
          height: 200,
        );
      },
      onWillAccept: ((data) => data == emoji),
      onAccept: (data) {
        print('accepted 1');
        _sendSquareCommand();
        setState(() {
          score[emoji] = true;
          step = 1;
        });
      },
      onLeave: (data) {},
    );
  }

  Widget _buildDragtarget2(emoji) {
    return DragTarget<String>(
      builder: (context, incoming, rejected) {
        return Image(
          image: choices[emoji],
          width: 300,
          height: 200,
        );
      },
      onWillAccept: ((data) => data == emoji),
      onAccept: (data) {
        print('accepted');
        _sendSquareCommand();

        setState(() {
          score[emoji] = true;
          step = 2;
        });
      },
      onLeave: (data) {},
    );
  }

  Widget _buildDragtarget3(emoji) {
    return DragTarget<String>(
      builder: (context, incoming, rejected) {
        return Image(
          image: finall[emoji],
          width: 300,
          height: 200,
        );
      },
      onWillAccept: ((data) => data == emoji),
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          step = 1;
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  const Emoji({super.key, required this.emoji});
  final String emoji;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 50),
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
