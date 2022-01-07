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
        height: size.width * 0.35,
        width: size.width * 0.35,
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
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: size.height * 0.002,
            ),
            Text(widget.widgetState.bottomText,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w300)),
            const Spacer(
              flex: 3,
            ),
          ],
        ));
  }
}
