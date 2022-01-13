import 'package:flutter/material.dart';
import 'package:portfolio/widgets/clippers/rectangular_clipper.dart';
import 'package:portfolio/widgets/clippers/triangular_clipper.dart';
import 'package:portfolio/widgets/containers/circular_widget.dart';
import 'package:portfolio/widgets/icons/bar_chart_icon.dart';
import 'package:portfolio/widgets/icons/folder_icon.dart';
import 'package:portfolio/widgets/icons/simpler_person_icon.dart';
import 'package:portfolio/widgets/icons/stylish_house_icon.dart';
import 'package:portfolio/widgets/icons/sales_icon.dart';
import 'package:portfolio/widgets/icons/customers_icon.dart';
import 'package:portfolio/widgets/icons/revenue_icon.dart';
import 'package:portfolio/widgets/icons/products_icon.dart';
import 'package:portfolio/widgets/icons/statistics_icon.dart';

import 'model/CircularWidgetState.dart';

//https://dribbble.com/shots/17195869-Finance-Dark-theme-Design/attachments/12296436?mode=media
class FinanceDarkTheme extends StatefulWidget {
  FinanceDarkTheme({Key? key}) : super(key: key);

  @override
  State<FinanceDarkTheme> createState() => _FinanceDarkThemeState();
}

class _FinanceDarkThemeState extends State<FinanceDarkTheme> {
  final _fieldController = TextEditingController();

  late FocusNode myFocusNode;

  final ThemeData specialThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.yellow[700],
    accentColor: Colors.orange[500],
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 18.0),
    ),
  );

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: specialThemeData,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.1, size.width * 0.1, size.width * 0.1, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  row1(size),
                  SizedBox(height: size.height * 0.075),
                  row2(size),
                  SizedBox(height: size.height * 0.075),
                  row3(size),
                  SizedBox(height: size.height * 0.015),
                  row(
                      CircularWidgetState(
                          const Color(0xe6dff1ff),
                          Padding(
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: SalesIcon(
                              size: size.width * 0.06,
                            ),
                          ),
                          "230k",
                          "Sales"),
                      CircularWidgetState(
                          const Color(0xc0dedcff),
                          CustomersIcon(size: size.width * 0.06),
                          "8.54k",
                          "Customers"),
                      size),
                  SizedBox(height: size.height * 0.02),
                  row(
                      CircularWidgetState(
                          const Color(0xf1eee9ff),
                          ProductsIcon(
                            size: size.width * 0.06,
                          ),
                          "1.423k",
                          "Products"),
                      CircularWidgetState(
                          const Color(0xf1dfdfff),
                          RevenueIcon(size: size.width * 0.06),
                          "\$9745",
                          "Revenue"),
                      size),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StylishHouseIcon(
                        width: size.width * 0.15,
                        height: size.height * 0.095,
                      ),
                      FolderIcon(size: size.width * 0.09),
                      BarChartIcon(
                          width: size.width * 0.09,
                          height: size.width * 0.09 / 1.3),
                      SimplerPersonIcon(
                          width: size.width * 0.09 * 0.66,
                          height: size.width * 0.09)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget row(CircularWidgetState leftChildState,
      CircularWidgetState rightChildState, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularWidget(leftChildState),
        SizedBox(width: size.width * 0.05),
        CircularWidget(rightChildState)
      ],
    );
  }

  Widget row3(Size size) {
    return SizedBox(
      height: size.height * 0.125,
      child: Stack(children: [
        TextField(
          focusNode: myFocusNode,
          controller: _fieldController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(size.height * 0.05),
              ),
            ),
          ),
        ),
        Visibility(
          visible:
              myFocusNode.hasFocus == false && _fieldController.text.isEmpty,
          child: Positioned(
            top: size.height * 0.005,
            left: size.width * 0.225,
            child: GestureDetector(
                onTapDown: (details) => setState(() {
                      myFocusNode.requestFocus();
                    }),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipPath(
                      clipper: CustomRectangularClipper(),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[600],
                        size: size.height * 0.065,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Search',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.grey[600]),
                      ),
                    )
                  ],
                )),
          ),
        ),
        // )
      ]),
    );
  }

  Widget row1(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()..rotateZ(-90 * 3.1415927 / 180),
            child: ClipPath(
                clipper: CustomTriangleClipper(),
                child: Icon(
                  Icons.menu,
                  size: size.height * 0.045,
                ))),
        Container(
            height: size.height * 0.065,
            width: size.width * 0.15,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(size.height * 0.001),
                child: Icon(Icons.person, size: size.width * 0.14)))
      ],
    );
  }

  Widget row2(Size size) {
    double fontController = size.width * 0.00275;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello David',
              style: TextStyle(
                  fontSize: fontController * 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text('Welcome Back !',
                style: TextStyle(
                  fontSize: fontController * 15,
                ))
          ],
        ),
        Container(
          height: size.width * 0.175,
          width: size.width * 0.175,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[700]!),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: StatisticsIcon(
              size: size.width * 0.08,
            ),
          ),
        )
      ],
    );
  }
}
