import 'package:flutter/material.dart';

class FourDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint brush = Paint();
    brush.strokeWidth = 2.5;
    brush.color = Colors.white;
    brush.style = PaintingStyle.fill;
    var gapBetweenCircles = 0.075;

    canvas.drawCircle(Offset(size.width / 4, size.height / 4),
        size.width * (0.25 - gapBetweenCircles), brush);
    canvas.drawCircle(Offset(3 * size.width / 4, size.height / 4),
        size.width * (0.25 - gapBetweenCircles), brush);
    canvas.drawCircle(Offset(size.width / 4, 3 * size.height / 4),
        size.width * (0.25 - gapBetweenCircles), brush);
    canvas.drawCircle(Offset(3 * size.width / 4, 3 * size.height / 4),
        size.width * (0.25 - gapBetweenCircles), brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
