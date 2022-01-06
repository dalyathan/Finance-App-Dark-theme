import 'package:flutter/material.dart';
import 'package:portfolio/model/CircularWidgetState.dart';

class CircularWidget extends StatefulWidget {
  final CircularWidgetState widgetState;
  const CircularWidget(this.widgetState, {Key? key}) : super(key: key);

  @override
  _CircularWidgetState createState() => _CircularWidgetState();
}

class _CircularWidgetState extends State<CircularWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: widget.widgetState.color,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.2)),
        child: Column(
          children: [
            widget.widgetState.icon,
            Text(widget.widgetState.mainText),
            Text(widget.widgetState.bottomText)
          ],
        ));
  }
}
