import 'package:flutter/material.dart';
import 'dart:math';

class LineGraphImagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint();
    brush.color = const Color.fromRGBO(192, 222, 220, 1);
    brush.strokeWidth = 2.5;
    brush.style = PaintingStyle.stroke;
    brush.strokeJoin = StrokeJoin.round;
    brush.strokeMiterLimit = 2;
    Random rand = Random();
    double minRandomDouble = 0.05;
    double maxRandomDouble = 0.1;

    Offset A = const Offset(0, 0);
    Offset B = Offset(size.width * 0.07, 0);
    Offset C = Offset(B.dx + size.width * 0.05, size.height * 0.1);
    Offset D = Offset(
        C.dx +
            size.width *
                rand.nextDouble() *
                (maxRandomDouble - minRandomDouble) +
            minRandomDouble,
        C.dy);
    Offset F = Offset(D.dx + size.width * 0.075, D.dy + size.height * 0.2);
    double slopeDF = (F.dy - D.dy) / (F.dx - D.dx);
    Offset E = Offset(
        D.dx + size.width * 0.055, (slopeDF * size.width * 0.055) + D.dy);
    Offset G = Offset(
        F.dx +
            size.width *
                rand.nextDouble() *
                (maxRandomDouble - minRandomDouble) +
            minRandomDouble,
        F.dy);
    Offset H = Offset(
        G.dx +
            size.width *
                rand.nextDouble() *
                (maxRandomDouble - minRandomDouble) +
            minRandomDouble,
        G.dy + size.height * 0.15);
    Offset I = Offset(
        H.dx +
            size.width *
                rand.nextDouble() *
                (maxRandomDouble - minRandomDouble) +
            minRandomDouble,
        H.dy - size.height * 0.08);
    Offset J = Offset(
        I.dx +
            size.width *
                rand.nextDouble() *
                (maxRandomDouble - minRandomDouble) +
            minRandomDouble,
        I.dy + size.height * 0.25);
    Offset K = Offset(J.dx + size.width * 0.1, J.dy - size.height * 0.15);
    Offset L = Offset(
        K.dx +
            size.width *
                rand.nextDouble() *
                (maxRandomDouble - minRandomDouble) +
            minRandomDouble,
        K.dy);
    Offset M = Offset(L.dx + size.width * 0.1, E.dy);
    double slopeLM = (M.dy - L.dy) / (M.dx - L.dx);
    Offset N = Offset((C.dy - M.dy) / slopeLM + M.dx, C.dy);
    //Offset O = Offset(N.dx + size.width * 0.075, N.dy);
    Offset O = Offset(size.width * 0.85, N.dy);
    canvas.drawLine(A, B, brush);
    canvas.drawLine(B, C, brush);
    canvas.drawLine(C, D, brush);
    canvas.drawLine(D, E, brush);
    brush.strokeWidth = 4;
    canvas.drawLine(E, F, brush);
    canvas.drawLine(F, G, brush);
    canvas.drawLine(G, H, brush);
    brush.strokeWidth = 3;
    canvas.drawLine(H, I, brush);
    canvas.drawLine(I, J, brush);
    brush.strokeWidth = 4;
    canvas.drawLine(J, K, brush);
    canvas.drawLine(K, L, brush);
    canvas.drawLine(L, M, brush);
    brush.strokeWidth = 2.5;
    canvas.drawLine(M, N, brush);
    canvas.drawLine(N, O, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
