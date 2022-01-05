import 'package:flutter/material.dart';

class CustomCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCircle(
        center: const Offset(0, 0), radius: size.height * 0.005));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
