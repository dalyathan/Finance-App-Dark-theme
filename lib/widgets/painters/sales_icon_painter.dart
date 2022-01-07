import 'dart:math';

import 'package:flutter/material.dart';

class SalesIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;
    // TODO: Set properties to paint
    var y = size.width / (sqrt(2) + 1);
    var x = y / sqrt(2);
    var path = Path();
    path.moveTo(x + y, 0);
    path.conicTo(size.width, 0, size.width, x, 2.5);

    path.moveTo(size.width, x + y);
    path.conicTo(size.width, size.height, size.width - x, size.height, 5 / 2);

    path.moveTo(x, size.height);
    path.conicTo(0, size.height, 0, size.height - x, 5 / 2);

    path.moveTo(0, x);
    path.conicTo(0, 0, x, 0, 5 / 2);
    // TODO: Draw your path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
