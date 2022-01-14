import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/house_icon_painter.dart';
import 'package:portfolio/widgets/painters/zig_zag_painter.dart';

class StylishHouseIcon extends StatefulWidget {
  final double width;
  final double height;
  const StylishHouseIcon({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  _StylishHouseIconState createState() => _StylishHouseIconState();
}

class _StylishHouseIconState extends State<StylishHouseIcon> {
  @override
  Widget build(BuildContext context) {
    Size houseIconSize = Size(widget.width * 0.6, widget.height * 0.45);
    return Stack(
      children: [
        Positioned(
          right: widget.width * 0.15,
          top: widget.height * 0.15,
          child: CustomPaint(
            size: houseIconSize,
            painter: HouseIconPainter(),
          ),
        ),
        Positioned(
            child: CustomPaint(
          size: Size(widget.width, widget.height),
          painter: ZigZagPainter(),
        ))
      ],
    );
  }
}
