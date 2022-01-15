import 'package:flutter/material.dart';
import 'package:portfolio/widgets/images/line_graph_image.dart';

class LineGraph extends StatefulWidget {
  const LineGraph({Key? key}) : super(key: key);

  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  double offset = 0.0;
  late Size size;
  String currentSelected = "";
  String writeThis = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double width = size.width * 0.8;
    double height = size.height * 0.35 < 250 ? size.height * 0.35 : 250;
    return Stack(children: [
      LineGraphImage(
        width: width,
        height: height * 0.75,
      ),
      AnimatedPositioned(
          duration: const Duration(milliseconds: 350),
          left: width * offset,
          top: height * 0.535,
          onEnd: () => setState(() {
                writeThis = currentSelected;
              }),
          child: selectedPeriod()),
      Positioned(
        top: height * 0.35,
        left: width * 0.06,
        child: SizedBox(
          width: width * 0.85,
          height: height * 0.55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              period("1D", 0),
              period("1W", 0.13),
              period("1M", 0.26),
              period("3M", 0.3925),
              period("6M", 0.525),
              period("9M", 0.66),
              period("1Y", 0.7875),
            ],
          ),
        ),
      ),
    ]);
  }

  Container selectedPeriod() {
    return Container(
      width: size.width * 0.15,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.035),
        color: const Color.fromRGBO(192, 222, 220, 1),
      ),
      child: Center(
          child: Text(writeThis,
              style: TextStyle(
                  fontSize: size.width * 0.0035 * 12.5, color: Colors.black))),
    );
  }

  GestureDetector period(String text, double myOffset) {
    return GestureDetector(
      onTap: () {
        setState(() {
          writeThis = "";
          currentSelected = text;
          offset = myOffset;
        });
      },
      child: Container(
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: size.width * 0.0035 * 12.5,
                  color: Colors.grey[700]!)),
        ),
      ),
    );
  }
}
