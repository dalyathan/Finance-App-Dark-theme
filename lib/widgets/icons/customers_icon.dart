import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/person_painter.dart';

class CustomersIcon extends StatefulWidget {
  final double size;
  const CustomersIcon({Key? key, required this.size}) : super(key: key);

  @override
  _CustomersIconState createState() => _CustomersIconState();
}

class _CustomersIconState extends State<CustomersIcon> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(widget.size),
      painter: PersonPainter(),
    );
  }
}
