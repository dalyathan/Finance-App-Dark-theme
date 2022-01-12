import 'dart:math';

import 'package:flutter/material.dart';

class FolderIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = Colors.grey[400]!;
    brush.strokeWidth = 2.5;
    brush.style = PaintingStyle.stroke;
    var gapAndRadiusRatio = 0.1;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width * gapAndRadiusRatio,
                size.height * gapAndRadiusRatio),
            radius: size.height * gapAndRadiusRatio),
        -pi / 2,
        -pi,
        false,
        brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
