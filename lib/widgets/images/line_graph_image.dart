import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/line_graph_image_painter.dart';

class LineGraphImage extends StatefulWidget {
  final double width;
  final double height;
  const LineGraphImage({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  _LineGraphImageState createState() => _LineGraphImageState();
}

class _LineGraphImageState extends State<LineGraphImage> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        widget.width,
        widget.height,
      ),
      painter: LineGraphImagePainter(),
    );
  }
}
