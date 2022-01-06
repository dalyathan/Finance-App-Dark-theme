import 'package:flutter/material.dart';

class CustomRectangularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width * 0.72, size.height * 0.72));
    path.addOval(
        Rect.fromCircle(center: const Offset(1, 0), radius: size.height));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
