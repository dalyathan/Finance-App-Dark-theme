import 'dart:math';

import 'package:flutter/material.dart';

class SearchIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = Colors.grey[600]!;
    brush.strokeWidth = 2;
    brush.style = PaintingStyle.stroke;

    var radiusRatio = 0.3;
    var corner = 0.7;

    canvas.drawCircle(
        Offset(size.width * radiusRatio, size.width * radiusRatio),
        size.width * radiusRatio,
        brush);
    Offset intersection = Offset(size.width * radiusRatio * (1 + 1 / sqrt(2)),
        size.width * radiusRatio * (1 + 1 / sqrt(2)));
    canvas.drawLine(
        intersection, Offset(corner * size.width, corner * size.height), brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
