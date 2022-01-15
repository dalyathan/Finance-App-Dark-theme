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
    double radius = size.width * 0.35;
    return Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          color: widget.widgetState.color,
          shape: BoxShape.circle,
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            widget.widgetState.icon,
            const Spacer(
              flex: 1,
            ),
            Text(
              widget.widgetState.mainText,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: radius * 0.006 * 25),
            ),
            SizedBox(
              height: radius * 0.005,
            ),
            Text(widget.widgetState.bottomText,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: radius * 0.005 * 20)),
            const Spacer(
              flex: 3,
            ),
          ],
        ));
  }
}
