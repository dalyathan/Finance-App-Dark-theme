import 'package:flutter/material.dart';
import 'dart:math';

class RevenueIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var slicedDistance = 0.2;
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;

    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width * 0.5, size.width * 0.5),
            width: size.width * (1 - slicedDistance),
            height: size.height * (1 - slicedDistance)),
        0,
        3 * pi / 2,
        true,
        paint);
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width * (0.5 + slicedDistance),
                size.width * (0.5 - slicedDistance)),
            width: size.width * (1 - slicedDistance),
            height: size.height * (1 - slicedDistance)),
        3 * pi / 2,
        pi / 2,
        true,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
