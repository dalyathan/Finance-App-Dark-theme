import 'package:flutter/material.dart';

class ProductsIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(size.width * 0.5, size.width * 0.5),
                width: size.width,
                height: size.height),
            Radius.circular(size.width * 0.2)),
        paint);

    canvas.drawLine(Offset(0, size.width * 0.25),
        Offset(size.width, size.width * 0.25), paint);

    canvas.drawLine(Offset(size.width * 0.625, size.width * 0.25),
        Offset(size.width * 0.625, size.width), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
