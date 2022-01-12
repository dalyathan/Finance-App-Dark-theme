import 'package:flutter/material.dart';

class HouseIconPainter extends CustomPainter {
  late Paint brush;
  late double curveRadius;
  late Size size;
  late Canvas canvas;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    curveRadius = 0.15;
    this.size = size;
    this.canvas = canvas;
    brush = Paint();

    brush.color = Colors.white;
    brush.strokeWidth = 3;
    brush.style = PaintingStyle.stroke;
    brush.strokeCap = StrokeCap.round;

    double rectRatio = 0.575;
    double chimneyHeight = 0.05;
    double chimneyWidth = 0.15;

    List<double> A = [size.width * 0.5, 0];
    List<double> B = [
      size.width * (0.5 - curveRadius),
      size.width * curveRadius
    ];
    List<double> C = [
      curveRadius * size.width,
      size.height * (1 - rectRatio) - size.width * curveRadius
    ];
    List<double> D = [0, size.height * (1 - rectRatio)];

    List<double> E = [
      0,
      size.height * (1 - rectRatio) + size.width * curveRadius
    ];
    List<double> F = [0, size.height - size.width * curveRadius];
    List<double> G = [0, size.height];
    List<double> H = [size.width * curveRadius, size.height];

    List<double> I = [size.width * (1 - curveRadius), H[1]];
    List<double> J = [size.width, G[1]];
    List<double> K = [size.width, F[1]];
    List<double> L = [size.width, E[1]];

    List<double> R = [size.width * (0.5 + curveRadius), B[1]];
    List<double> M = [size.width, D[1]];
    List<double> N = [size.width * (1 - curveRadius), C[1]];
    double gojoSlope = (R[1] - N[1]) / (R[0] - N[0]);
    List<double> P = [
      R[0] + size.height * chimneyHeight / gojoSlope,
      size.height * chimneyHeight + R[1]
    ];
    List<double> Q = [P[0], size.height * 0.065];
    List<double> O = [
      P[0] + size.width * chimneyWidth,
      P[1] + size.width * chimneyWidth * gojoSlope
    ];

    canvas.drawLine(Offset(B[0], B[1]), Offset(C[0], C[1]), brush);
    makeCurveBetweeenIntersections(C, D, E);
    canvas.drawLine(Offset(E[0], E[1]), Offset(F[0], F[1]), brush);
    makeCurveBetweeenIntersections(F, G, H);
    canvas.drawLine(Offset(H[0], H[1]), Offset(I[0], I[1]), brush);
    makeCurveBetweeenIntersections(I, J, K);
    canvas.drawLine(Offset(K[0], K[1]), Offset(L[0], L[1]), brush);
    makeCurveBetweeenIntersections(L, M, N);
    canvas.drawLine(Offset(N[0], N[1]), Offset(O[0], O[1]), brush);
    canvas.drawLine(Offset(P[0], P[1]), Offset(Q[0], Q[1]), brush);
    canvas.drawLine(Offset(R[0], R[1]), Offset(P[0], P[1]), brush);
    makeCurveBetweeenIntersections(B, A, R);
  }

  makeCurveBetweeenIntersections(
      List<double> from, List<double> control, List<double> to) {
    Path curvedCorner = Path();
    curvedCorner.moveTo(from[0], from[1]);
    curvedCorner.quadraticBezierTo(control[0], control[1], to[0], to[1]);
    canvas.drawPath(curvedCorner, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
