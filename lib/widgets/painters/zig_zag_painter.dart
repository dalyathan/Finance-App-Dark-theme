import 'package:flutter/material.dart';

class ZigZagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint brush = Paint();
    brush.color = const Color(0xe6dff1ff);
    brush.style = PaintingStyle.fill;
    brush.strokeWidth = 3.5;
    brush.strokeJoin = StrokeJoin.miter;
    brush.strokeMiterLimit = 6;

    Offset topEnd = Offset(size.width * 0.65, 0);
    Offset bottomEnd = Offset(size.width * 0.2, size.height);
    Offset leftJoint = Offset(0, size.height * 0.625);
    Offset rightJoint = Offset(size.width, size.height * 0.25);

    canvas.drawLine(topEnd, leftJoint, brush);
    canvas.drawLine(leftJoint, rightJoint, brush);
    canvas.drawLine(rightJoint, bottomEnd, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
