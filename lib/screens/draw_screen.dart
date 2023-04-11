/*
import 'dart:math';

import 'package:flutter/material.dart';

import '../drawcontainer.dart';

class DrawingBoard extends StatefulWidget {
  const DrawingBoard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DrawingBoard> createState() => _DrawingBoard();
}

class _DrawingBoard extends State<DrawingBoard> {
  dynamic _balls;
  dynamic _squars;
  dynamic _triangles;
  double xPos = 55;
  double yPos = 855;
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    final Color background = Colors.redAccent;
    final Color fill = Colors.grey;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillPercent = 15; // fills 56.23% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    _squars = _paintSquare(xPosition: xPos + 20, yPosition: yPos);
    _balls = _paint(xPosition: xPos, yPosition: yPos, ballRad: 40);
    return Scaffold(
        body: GestureDetector(
      onHorizontalDragDown: (details) {
        setState(() {
          if (_balls.isBallRegion(
              details.localPosition.dx, details.localPosition.dy)) {
            isClick = true;
          }
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          isClick = false;
        });
      },
      onHorizontalDragUpdate: (details) {
        if (isClick) {
          setState(() {
            xPos = details.localPosition.dx;
            print(xPos);
            yPos = details.localPosition.dy;
            print(yPos);
          });
        }
      },
      child:
          /*  MyCustomContainer(
          progress: 0.7,
          size: 100,
          backgroundColor: Colors.grey,
          progressColor: Colors.red,
          child: CustomPaint(
          painter: _balls,
        ),*/

          Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Colors.lightBlueAccent,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            stops: stops,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),

        child: CustomPaint(
          painter: _balls,
        ),
      ),
    ));
  }
}

class _paint extends CustomPainter {
  final xPosition;
  final yPosition;
  final ballRad;

  _paint({
    required this.xPosition,
    required this.yPosition,
    required this.ballRad,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();

    for (double i = 0; i < ballRad - 1; i++) {
      path.addOval(
          Rect.fromCircle(center: Offset(xPosition, yPosition), radius: i));
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  bool isBallRegion(double checkX, double checkY) {
    if ((pow(xPosition - checkX, 2) + pow(yPosition - checkY, 2)) <=
        pow(ballRad, 2)) {
      return true;
    }
    return false;
  }
}

class _paintSquare extends CustomPainter {
  final xPosition;
  final yPosition;

  _paintSquare({
    required this.xPosition,
    required this.yPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();

    path.addOval(
        //   Rect.fromCircle(center: Offset(xPosition, yPosition), radius: i));
        Rect.fromLTWH(0, 0, 100, 100));

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
  bool isBallRegion(double checkX, double checkY) {
    if ((pow(xPosition - checkX, 2) + pow(yPosition - checkY, 2)) <=
        pow(10, 2)) {
      return true;
    }
    return false;
  }
}

*/

import 'dart:io';
import 'dart:math';

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
    super.initState();
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
    'f': AssetImage('assets/dar.png'),
  };
  final Map choices1 = {
    '▢': AssetImage('assets/sq.png'),
  };
  final Map choices2 = {
    '△': AssetImage('assets/tr.png'),
  };
  final Map choices = {
    '△': AssetImage('assets/tr.png'),
    '〇': AssetImage('assets/outline1.png'),
    '▢': AssetImage('assets/sq.png'),
  };
  int seed = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('steps ${score.length} / 2'),
        backgroundColor: Constants.kBlackColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.kBlackColor,
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
            step = 0;
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () async {
              _isConnected == false ? await _connect() : await _disconnect();
            },
            child: Text("Start"),
          ),
          const Text('Draw a house'),
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
