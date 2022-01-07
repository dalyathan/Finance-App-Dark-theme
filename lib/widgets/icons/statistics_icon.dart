import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/statistics_icon_painter.dart';

class StatisticsIcon extends StatefulWidget {
  final double size;
  const StatisticsIcon({Key? key, required this.size}) : super(key: key);

  @override
  _StatisticsIconState createState() => _StatisticsIconState();
}

class _StatisticsIconState extends State<StatisticsIcon> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(widget.size),
      painter: StatisticsIconPainter(),
    );
  }
}
