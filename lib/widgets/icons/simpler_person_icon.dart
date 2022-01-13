import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/simpler_person_icon_painter.dart';

class SimplerPersonIcon extends StatefulWidget {
  final double width;
  final double height;
  const SimplerPersonIcon({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  _SimplerPersonIconState createState() => _SimplerPersonIconState();
}

class _SimplerPersonIconState extends State<SimplerPersonIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.height * 0.35),
      child: CustomPaint(
        size: Size(widget.width, widget.height),
        painter: SimplerPersonIconPainter(),
      ),
    );
  }
}
