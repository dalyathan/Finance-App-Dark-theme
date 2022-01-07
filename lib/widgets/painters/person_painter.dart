import 'package:flutter/material.dart';
import 'dart:math';

class PersonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
    canvas.drawCircle(Offset(size.width / 2, 2.25 * size.height / 6.5),
        size.width / 5.5, paint);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height),
            radius: size.width / 3.1),
        3.3 * pi / 3,
        2.4 * pi / 3,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
