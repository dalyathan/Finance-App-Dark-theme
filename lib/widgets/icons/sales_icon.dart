import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/percent_painter.dart';
import 'package:portfolio/widgets/painters/sales_icon_painter.dart';

class SalesIcon extends StatefulWidget {
  final double size;
  const SalesIcon({Key? key, required this.size}) : super(key: key);

  @override
  State<SalesIcon> createState() => _SalesIconState();
}

class _SalesIconState extends State<SalesIcon> {
  @override
  Widget build(BuildContext context) {
    Size sizeofIcon = Size.square(widget.size);
    return Stack(
      children: [
        Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()..rotateZ(45 * pi / 180),
          child: CustomPaint(
            size: sizeofIcon * 0.8,
            painter: SalesIconPainter(),
          ),
        ),
        CustomPaint(
            size: sizeofIcon * 0.8,
            painter: SalesIconPainter(),
            child: Padding(
              padding: EdgeInsets.all(sizeofIcon.width * 0.2),
              child: CustomPaint(
                size: sizeofIcon * 0.4,
                painter: PercentPainter(),
              ),
            ))
      ],
    );
  }
}
