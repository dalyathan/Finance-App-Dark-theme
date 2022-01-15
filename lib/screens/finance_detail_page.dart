import 'package:flutter/material.dart';
import 'package:portfolio/model/CircularWidgetState.dart';
import 'package:portfolio/model/data.dart';
import 'package:portfolio/model/dummy_data.dart';
import 'package:portfolio/widgets/containers/line_graph.dart';
import 'package:portfolio/widgets/containers/profile_row.dart';
import 'package:portfolio/widgets/icons/customers_icon.dart';
import 'package:portfolio/widgets/icons/products_icon.dart';
import 'package:portfolio/widgets/icons/revenue_icon.dart';

import '../widgets/icons/sales_icon.dart';

class FinanceDetailPage extends StatefulWidget {
  FinanceDetailPage({Key? key}) : super(key: key);

  @override
  State<FinanceDetailPage> createState() => _FinanceDetailPageState();
}

class _FinanceDetailPageState extends State<FinanceDetailPage> {
  late Size size;
  late Data currentData;
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
    // TODO: implement initState
    currentData = DummyData.getData(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Theme(
      data: specialThemeData,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: size.height * 0.025),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: const ProfileRow(),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Column(
                  children: [
                    showGraphHeading(),
                    SizedBox(height: size.height * 0.025),
                    LineGraph(
                      updateData: (index) => setState(() {
                        currentData = DummyData.getData(index);
                      }),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.1),
                      color: const Color.fromRGBO(53, 53, 53, 1),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.065),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.025),
                          salesRevenueTitle(),
                          SizedBox(height: size.height * 0.025),
                          salesRevenueBar(
                              CircularWidgetState(
                                  const Color.fromRGBO(192, 222, 220, 1),
                                  Padding(
                                    padding: EdgeInsets.all(size.width * 0.01),
                                    child: SalesIcon(
                                      size: size.width * 0.06,
                                    ),
                                  ),
                                  currentData.sales,
                                  "Sales"),
                              currentData.description),
                          SizedBox(height: size.height * 0.025),
                          salesRevenueBar(
                              CircularWidgetState(
                                  const Color.fromRGBO(230, 223, 241, 1),
                                  CustomersIcon(size: size.width * 0.06),
                                  currentData.customers,
                                  "Customers"),
                              currentData.description),
                          SizedBox(height: size.height * 0.025),
                          salesRevenueBar(
                              CircularWidgetState(
                                  const Color.fromRGBO(241, 238, 233, 1),
                                  ProductsIcon(
                                    size: size.width * 0.06,
                                  ),
                                  currentData.products,
                                  "Products"),
                              currentData.description),
                          SizedBox(height: size.height * 0.025),
                          salesRevenueBar(
                              CircularWidgetState(
                                  const Color.fromRGBO(241, 223, 223, 1),
                                  RevenueIcon(size: size.width * 0.06),
                                  currentData.revenue,
                                  "Revenue"),
                              currentData.description),
                          SizedBox(height: size.height * 0.025),
                        ],
                      ),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Text salesRevenueTitle() {
    return Text(
      "Sales Revenue",
      style: TextStyle(
          fontSize: size.width * 0.0035 * 25, fontWeight: FontWeight.bold),
    );
  }

  Row salesRevenueBar(CircularWidgetState data, String description) {
    double totalWidthRatio = 1 - 2 * (0.065 + 0.05);
    double iconRatio = 0.15;
    double smallMargin = 0.025;
    double descriptionRatio = 0.375;
    return Row(
      children: [
        Container(
            height: size.width * iconRatio,
            width: size.width * iconRatio,
            decoration: BoxDecoration(
              color: data.color,
              shape: BoxShape.circle,
            ),
            child: Center(child: data.icon)),
        SizedBox(width: size.width * smallMargin),
        SizedBox(
          width: size.width * descriptionRatio,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.bottomText,
                style: TextStyle(
                    fontSize: size.width * iconRatio * 0.02 * 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(description,
                  style: TextStyle(
                      fontSize: size.width * iconRatio * 0.02 * 12.5,
                      color: Colors.grey[700]!))
            ],
          ),
        ),
        SizedBox(width: size.width * 1.5 * smallMargin),
        SizedBox(
          width: size.width *
              (totalWidthRatio -
                  (iconRatio + 2.5 * smallMargin + descriptionRatio)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(data.mainText,
                style: TextStyle(
                    fontSize: size.width * iconRatio * 0.02 * 20,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }

  Row showGraphHeading() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      description("\$ 4,732.97", "Global Avg."),
      description("\$ 80.3M", "Market Cap"),
      description("\$ 1.73M", "Volume"),
    ]);
  }

  Widget description(String amount, String type) {
    return Column(
      children: [
        Text(amount,
            style: TextStyle(
                fontSize: size.width * 0.0035 * 12.5,
                fontWeight: FontWeight.bold)),
        SizedBox(height: size.height * 0.005),
        Text(type,
            style: TextStyle(
                fontSize: size.width * 0.0035 * 12.5, color: Colors.grey[700]!))
      ],
    );
  }
}
