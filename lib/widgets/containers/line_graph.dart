import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/widgets/images/line_graph_image.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LineGraph extends StatefulWidget {
  const LineGraph({Key? key}) : super(key: key);

  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  late Size size;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  double offset = 0.04;
  double nowOffset = 0.04;
  List<double> offsets = [0.04, 0.155, 0.28, 0.3975, 0.52, 0.645, 0.76];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    double width = size.width * 0.8;
    double height = size.height * 0.35 < 250 ? size.height * 0.35 : 250;
    return Stack(children: [
      Container(
        height: height * 0.75,
        child: ScrollablePositionedList.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) => VisibilityDetector(
              key: Key('my-key$index'),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction >= 0.5) {
                  print('responding to visibilty change from $index');
                  setState(() {
                    offset = offsets[index];
                  });
                }
              },
              child: LineGraphImage(
                width: width,
                height: height * 0.75,
              )),
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
        ),
      ),
      AnimatedPositioned(
          duration: const Duration(milliseconds: 350),
          left: width * offset,
          top: height * 0.535,
          curve: Curves.easeInOutCubic,
          onEnd: () => setState(() {
                nowOffset = offset;
              }),
          child: selectedPeriod()),
      Positioned(
        top: height * 0.35,
        left: width * 0.06,
        child: SizedBox(
          width: width * 0.85,
          height: height * 0.55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              period("1D", 0),
              period("1W", 1),
              period("1M", 2),
              period("3M", 3),
              period("6M", 4),
              period("9M", 5),
              period("1Y", 6),
            ],
          ),
        ),
      ),
    ]);
  }

  Container selectedPeriod() {
    return Container(
      width: size.width * 0.135,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.035),
        color: const Color.fromRGBO(192, 222, 220, 1),
      ),
    );
  }

  GestureDetector period(String text, int index) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          nowOffset = 0.0;
          offset = offsets[index];
        });
        itemScrollController.scrollTo(
            index: index,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic);
      },
      child: Container(
        width: size.width * 0.095,
        height: size.height * 0.05,
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: size.width * 0.0035 * 12.5,
                  color: nowOffset == offsets[index]
                      ? Colors.black
                      : Colors.grey[700]!)),
        ),
      ),
    );
  }
}
