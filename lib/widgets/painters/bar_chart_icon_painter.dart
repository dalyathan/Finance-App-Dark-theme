import 'package:flutter/material.dart';

class BarChartIconPainter extends CustomPainter {
  late Paint brush;
  late Canvas myCanvas;
  @override
  void paint(Canvas canvas, Size size) {
    myCanvas = canvas;
    brush = Paint();
    brush.color = Colors.grey[600]!;
    brush.strokeWidth = 3;
    brush.style = PaintingStyle.stroke;
    var secondPlaceBarRatio = 0.55;
    var thirdPlaceBarRatio = 0.4;
    var curveRadius = 0.2;

    Offset A =
        Offset(0, size.height * (1 - (secondPlaceBarRatio - curveRadius)));
    Offset B = Offset(
        size.height * curveRadius, size.height * (1 - secondPlaceBarRatio));
    Offset C = Offset(size.width / 3, B.dy);
    Offset D = Offset(C.dx, size.height * curveRadius);
    Offset E = Offset(size.width / 3 + size.height * curveRadius, 0);
    Offset F = Offset(2 * size.width / 3 - size.height * curveRadius, 0);
    Offset G = Offset(2 * size.width / 3, size.height * curveRadius);
    Offset H = Offset(G.dx, A.dy);
    Offset I = Offset(size.width - size.height * curveRadius, A.dy);
    Offset J = Offset(size.width, A.dy + size.height * curveRadius);
    Offset K = Offset(G.dx, size.height);
    Offset L = Offset(D.dx, size.height);
    Offset middleLeftCorner = Offset(A.dx, B.dy);
    Offset bottomLeftCorner = Offset(A.dx, size.height);
    Offset topLeftCorner = Offset(D.dx, 0);
    Offset topRightCorner = Offset(G.dx, 0);
    Offset middleRightCorner = Offset(size.width, A.dy);
    Offset bottomRightCorner = Offset(size.width, size.height);
    myCanvas.drawLine(B, C, brush);
    myCanvas.drawLine(D, L, brush);
    makeCurveBetweeenIntersections(D, topLeftCorner, E);
    myCanvas.drawLine(E, F, brush);
    makeCurveBetweeenIntersections(F, topRightCorner, G);
    myCanvas.drawLine(G, K, brush);
    myCanvas.drawLine(H, I, brush);
    makeCurveBetweeenIntersections(I, middleRightCorner, J);
    myCanvas.drawLine(J, bottomRightCorner, brush);
    makeCurveBetweeenIntersections(A, middleLeftCorner, B);
    myCanvas.drawLine(bottomLeftCorner, bottomRightCorner, brush);
    myCanvas.drawLine(A, bottomLeftCorner, brush);
  }

  makeCurveBetweeenIntersections(Offset from, Offset control, Offset to) {
    Path curvedCorner = Path();
    curvedCorner.moveTo(from.dx, from.dy);
    curvedCorner.quadraticBezierTo(control.dx, control.dy, to.dx, to.dy);
    myCanvas.drawPath(curvedCorner, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
