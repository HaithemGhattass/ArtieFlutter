import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShapePainter extends CustomPainter {
  final colors = [Colors.red, Colors.yellow, Colors.lightBlue];
  Path path = Path();
  Paint _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 5
    ..strokeCap = StrokeCap.round;

  final bool down;
  final double x;
  final double y;
  Map<int, Map<String, double>> pathList;
  ShapePainter({
    required this.down,
    required this.x,
    required this.y,
    required this.pathList,
  });
  @override
  void paint(Canvas canvas, Size size) {
    for (var pathData in pathList.values) {
      _paint = _paint..color = colors[pathData['color']! as int];
      path = Path()
        ..addOval(Rect.fromCircle(
            center: Offset(pathData['x']!, pathData['y']!),
            radius: pathData['r']!));
      canvas.drawPath(path, _paint);
    }
  }

  @override
  bool shouldRepaint(ShapePainter oldDelegate) => down;
}
