import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/revenue_icon_painter.dart';

class RevenueIcon extends StatefulWidget {
  final double size;
  const RevenueIcon({Key? key, required this.size}) : super(key: key);

  @override
  _RevenueIconState createState() => _RevenueIconState();
}

class _RevenueIconState extends State<RevenueIcon> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(widget.size),
      painter: RevenueIconPainter(),
    );
  }
}
