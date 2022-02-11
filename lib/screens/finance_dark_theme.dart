import 'package:flutter/material.dart';
import 'package:portfolio/screens/finance_detail_page.dart';
import 'package:portfolio/widgets/containers/circular_widget.dart';
import 'package:portfolio/widgets/containers/profile_row.dart';
import 'package:portfolio/widgets/icons/bar_chart_icon.dart';
import 'package:portfolio/widgets/icons/customers_icon.dart';
import 'package:portfolio/widgets/icons/folder_icon.dart';
import 'package:portfolio/widgets/icons/search_icon.dart';
import 'package:portfolio/widgets/icons/simpler_person_icon.dart';
import 'package:portfolio/widgets/icons/stylish_house_icon.dart';
import 'package:portfolio/widgets/icons/sales_icon.dart';
import 'package:portfolio/widgets/icons/revenue_icon.dart';
import 'package:portfolio/widgets/icons/statistics_icon.dart';

import '../model/CircularWidgetState.dart';
import '../widgets/icons/products_icon.dart';

//https://dribbble.com/shots/17195869-Finance-Dark-theme-Design/attachments/12296436?mode=media
class FinanceDarkTheme extends StatefulWidget {
  const FinanceDarkTheme({Key? key}) : super(key: key);

  @override
  State<FinanceDarkTheme> createState() => _FinanceDarkThemeState();
}

class _FinanceDarkThemeState extends State<FinanceDarkTheme> {
  final _fieldController = TextEditingController();
  int _selectedIndex = 0;
  late Size size;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
                    const ProfileRow(),
                    SizedBox(height: size.height * 0.075),
                    greetings(),
                    SizedBox(height: size.height * 0.075),
                    searchBar(),
                    SizedBox(height: size.height * 0.05),
                    row(
                        CircularWidgetState(
                            const Color(0xe6dff1ff),
                            Padding(
                                padding: EdgeInsets.all(size.width * 0.01),
                                child: SalesIcon(
                                  size: size.width * 0.06,
                                )),
                            "1.423k",
                            "Products"),
                        CircularWidgetState(
                            const Color.fromRGBO(230, 223, 241, 1),
                            CustomersIcon(size: size.width * 0.06),
                            "8.54k",
                            "Customers")),
                    SizedBox(height: size.height * 0.015),
                    row(
                        CircularWidgetState(
                            const Color.fromRGBO(192, 222, 220, 1),
                            Padding(
                              padding: EdgeInsets.all(size.width * 0.01),
                              child: ProductsIcon(
                                size: size.width * 0.06,
                              ),
                            ),
                            "230k",
                            "Sales"),
                        CircularWidgetState(
                            const Color(0xf1dfdfff),
                            RevenueIcon(size: size.width * 0.06),
                            "\$9745",
                            "Revenue")),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: bottomNavbar()),
    );
  }

  BottomNavigationBar bottomNavbar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: StylishHouseIcon(
              width: size.width * 0.125,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: FolderIcon(size: size.width * 0.09), label: ''),
        BottomNavigationBarItem(
            icon: BarChartIcon(
                width: size.width * 0.09, height: size.width * 0.09 / 1.3),
            label: ''),
        BottomNavigationBarItem(
            icon: SimplerPersonIcon(
                width: size.width * 0.09 * 0.66, height: size.width * 0.09),
            label: ''),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  Widget row(
      CircularWidgetState leftChildState, CircularWidgetState rightChildState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularWidget(leftChildState),
        SizedBox(width: size.width * 0.05),
        CircularWidget(rightChildState)
      ],
    );
  }

  Widget searchBar() {
    double height = size.height * 0.125 < 57.5 ? size.height * 0.125 : 57.5;
    double width = size.width * 0.8;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(children: [
        TextField(
          focusNode: myFocusNode,
          controller: _fieldController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(height * 0.5),
              ),
            ),
          ),
        ),
        Visibility(
          visible:
              myFocusNode.hasFocus == false && _fieldController.text.isEmpty,
          child: Positioned(
            top: height * 0.275,
            left: width * 0.325,
            child: GestureDetector(
                onTapDown: (details) => setState(() {
                      myFocusNode.requestFocus();
                    }),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SearchIcon(
                      size: height * 0.65,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.27),
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
      ]),
    );
  }

  Widget greetings() {
    double fontController = size.width * 0.00275;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Surafel',
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
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_context) => FinanceDetailPage())),
          child: Container(
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
          ),
        )
      ],
    );
  }
}
