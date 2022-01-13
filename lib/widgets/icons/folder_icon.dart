import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/folder_icon_painter.dart';

class FolderIcon extends StatefulWidget {
  final double size;
  const FolderIcon({Key? key, required this.size}) : super(key: key);

  @override
  _FolderIconState createState() => _FolderIconState();
}

class _FolderIconState extends State<FolderIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.size * 0.375),
      child: CustomPaint(
        size: Size.square(widget.size),
        painter: FolderIconPainter(),
      ),
    );
  }
}
