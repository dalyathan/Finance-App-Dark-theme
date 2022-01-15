import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/house_icon_painter.dart';
import 'package:portfolio/widgets/painters/zig_zag_painter.dart';

class StylishHouseIcon extends StatefulWidget {
  final double width;
  const StylishHouseIcon({Key? key, required this.width}) : super(key: key);

  @override
  _StylishHouseIconState createState() => _StylishHouseIconState();
}

class _StylishHouseIconState extends State<StylishHouseIcon> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = 1.33 * widget.width;
    double houseWidthRatio = 0.725;
    double houseHeightRatio = houseWidthRatio / 1.33;
    Size houseIconSize =
        Size(widget.width * houseWidthRatio, totalHeight * houseHeightRatio);
    return Stack(
      children: [
        Positioned(
          right: widget.width * 0.085,
          top: totalHeight * 0.085,
          child: CustomPaint(
            size: houseIconSize,
            painter: HouseIconPainter(),
          ),
        ),
        Positioned(
            child: CustomPaint(
          size: Size(widget.width, totalHeight),
          painter: ZigZagPainter(),
        ))
      ],
    );
  }
}
