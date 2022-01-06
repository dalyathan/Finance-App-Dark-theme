import 'package:flutter/material.dart';

class PercentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint.color = Colors.grey[600]!;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, 0);
    path.moveTo(size.width, size.height);
    canvas.drawPath(path, paint);
    canvas.drawCircle(
        Offset(size.width * 0.9, size.height * 0.9), size.width * 0.1, paint);
    canvas.drawCircle(
        Offset(size.width * 0.1, size.height * 0.1), size.width * 0.1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
