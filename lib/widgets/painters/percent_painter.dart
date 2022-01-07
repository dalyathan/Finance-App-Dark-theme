import 'package:flutter/material.dart';

class PercentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, 0);
    path.moveTo(size.width, size.height);
    canvas.drawPath(path, paint);
    var circlePainter = Paint();
    circlePainter.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.9),
        size.width * 0.2, circlePainter);
    canvas.drawCircle(Offset(size.width * 0.1, size.height * 0.1),
        size.width * 0.2, circlePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
