import 'package:flutter/material.dart';
import 'package:portfolio/widgets/painters/table_painter.dart';

class ProductsIcon extends StatefulWidget {
  final double size;
  const ProductsIcon({Key? key, required this.size}) : super(key: key);

  @override
  _ProductsIconState createState() => _ProductsIconState();
}

class _ProductsIconState extends State<ProductsIcon> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(widget.size),
      painter: ProductsIconPainter(),
    );
  }
}
