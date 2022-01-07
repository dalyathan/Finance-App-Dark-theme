import 'package:flutter/material.dart';

class StatisticsIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    var radiusRatio = 0.18;
    var biggerLineRatio = 0.445;
    var gapBetweenCircles = 0.25;

    canvas.drawLine(Offset(0, size.height * radiusRatio),
        Offset(size.width * biggerLineRatio, size.height * radiusRatio), paint);
    canvas.drawCircle(
        Offset(size.width * (biggerLineRatio + radiusRatio),
            size.height * radiusRatio),
        size.width * radiusRatio,
        paint);
    canvas.drawLine(
        Offset(size.width * (biggerLineRatio + 2 * radiusRatio),
            size.height * radiusRatio),
        Offset(size.width, size.height * radiusRatio),
        paint);
    canvas.drawLine(
        Offset(0, size.height * (3 * radiusRatio + gapBetweenCircles)),
        Offset(size.width * (1 - biggerLineRatio - 2 * radiusRatio),
            size.height * (3 * radiusRatio + gapBetweenCircles)),
        paint);
    canvas.drawCircle(
        Offset(size.width * (1 - biggerLineRatio - radiusRatio),
            size.height * (3 * radiusRatio + gapBetweenCircles)),
        size.width * radiusRatio,
        paint);
    canvas.drawLine(
        Offset(size.width * (1 - biggerLineRatio),
            size.height * (3 * radiusRatio + gapBetweenCircles)),
        Offset(size.width, size.height * (3 * radiusRatio + gapBetweenCircles)),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
