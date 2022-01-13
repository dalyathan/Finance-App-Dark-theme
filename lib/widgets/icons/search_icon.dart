import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/search_icon_painter.dart';

class SearchIcon extends StatefulWidget {
  final double size;
  const SearchIcon({Key? key, required this.size}) : super(key: key);

  @override
  _SearchIconState createState() => _SearchIconState();
}

class _SearchIconState extends State<SearchIcon> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(widget.size),
      painter: SearchIconPainter(),
    );
  }
}
