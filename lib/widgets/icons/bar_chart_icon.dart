import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/bar_chart_icon_painter.dart';

class BarChartIcon extends StatefulWidget {
  final double width;
  final double height;
  const BarChartIcon({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  _BarChartIconState createState() => _BarChartIconState();
}

class _BarChartIconState extends State<BarChartIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.height * 0.7),
      child: CustomPaint(
          size: Size(widget.width, widget.height),
          painter: BarChartIconPainter()),
    );
  }
}
