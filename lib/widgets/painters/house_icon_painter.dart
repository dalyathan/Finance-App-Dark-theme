import 'package:flutter/material.dart';

class HouseIconPainter extends CustomPainter {
  late Paint brush;
  late double curveRadius;
  late Size size;
  late Canvas canvas;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    curveRadius = 0.25;
    this.size = size;
    this.canvas = canvas;
    brush = Paint();

    brush.color = Colors.white;
    brush.strokeWidth = 3;
    brush.style = PaintingStyle.stroke;
    brush.strokeCap = StrokeCap.round;

    double rectRatio = 0.4;

    var A = [size.width * 0.5, 0];
    var B = [size.width * (0.5 - curveRadius), size.width * curveRadius];
    var C = [
      curveRadius * size.width,
      size.height * (1 - rectRatio) - 2 * size.width * curveRadius
    ];
    canvas.drawLine(
      Offset(0, size.height * rectRatio + size.width * curveRadius),
      Offset(0, size.height - size.width * curveRadius),
      brush,
    ); //|
    makeCurveBetweeenIntersections(size.width * curveRadius, size.height, 0,
        size.height, 0, size.height - size.width * curveRadius);
    canvas.drawLine(
      Offset(size.width * curveRadius, size.height),
      Offset(size.width - size.width * curveRadius, size.height),
      brush,
    ); //__
    canvas.drawLine(
      Offset(size.width, size.height * rectRatio + size.width * curveRadius),
      Offset(size.width, size.height - size.width * curveRadius),
      brush,
    ); //   |
    makeCurveBetweeenIntersections(
        size.width - size.width * curveRadius,
        size.height,
        size.width,
        size.height,
        size.width,
        size.height - size.width * curveRadius);
    canvas.drawLine(
      Offset(0.65 * size.width * curveRadius,
          size.height * (1 - rectRatio) - 1.25 * size.width * curveRadius),
      Offset(size.width * 0.6 - size.width * curveRadius,
          size.width * curveRadius),
      brush,
    ); // /
    makeCurveBetweeenIntersections(
        0,
        size.height * rectRatio + size.width * curveRadius,
        0,
        size.height * rectRatio,
        0.65 * size.width * curveRadius,
        size.height * (1 - rectRatio) - 1.25 * size.width * curveRadius);
  }

  makeCurveBetweeenIntersections(
      double moveX, double moveY, double x1, double y1, double x2, double y2) {
    Path bottomLeftCorner = Path();
    bottomLeftCorner.moveTo(moveX, moveY);
    bottomLeftCorner.quadraticBezierTo(x1, y1, x2, y2);
    canvas.drawPath(bottomLeftCorner, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
