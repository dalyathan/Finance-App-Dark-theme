import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/percent_painter.dart';
import 'package:portfolio/widgets/painters/sales_icon_painter.dart';

class OctagonStar extends StatelessWidget {
  const OctagonStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size sizeofIcon = Size(size.width * 0.065, size.width * 0.065);
    return Stack(
      children: [
        Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()..rotateZ(45 * pi / 180),
          child: CustomPaint(
            size: sizeofIcon,
            painter: SalesIconPainter(),
          ),
        ),
        CustomPaint(
            size: sizeofIcon,
            painter: SalesIconPainter(),
            child: Padding(
              padding: EdgeInsets.all(sizeofIcon.width * 0.25),
              child: CustomPaint(
                size: sizeofIcon * 0.5,
                painter: PercentPainter(),
              ),
            ))
      ],
    );
  }
}
