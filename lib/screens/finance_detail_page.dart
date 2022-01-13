import 'package:flutter/material.dart';
import 'package:portfolio/model/CircularWidgetState.dart';
import 'package:portfolio/widgets/containers/profile_row.dart';
import 'package:portfolio/widgets/icons/customers_icon.dart';
import 'package:portfolio/widgets/icons/products_icon.dart';
import 'package:portfolio/widgets/icons/revenue_icon.dart';
import 'package:portfolio/widgets/images/line_graph_image.dart';

import '../widgets/icons/sales_icon.dart';

class FinanceDetailPage extends StatelessWidget {
  FinanceDetailPage({Key? key}) : super(key: key);
  late Size size;
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
                    showGraph()
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.0125),
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
                                "230k",
                                "Sales"),
                          ),
                          SizedBox(height: size.height * 0.025),
                          salesRevenueBar(
                            CircularWidgetState(
                                const Color.fromRGBO(230, 223, 241, 1),
                                CustomersIcon(size: size.width * 0.06),
                                "8.54k",
                                "Customers"),
                          ),
                          SizedBox(height: size.height * 0.025),
                          salesRevenueBar(
                            CircularWidgetState(
                                const Color.fromRGBO(241, 238, 233, 1),
                                ProductsIcon(
                                  size: size.width * 0.06,
                                ),
                                "1.423k",
                                "Products"),
                          ),
                          SizedBox(height: size.height * 0.025),
                          salesRevenueBar(
                            CircularWidgetState(
                                const Color.fromRGBO(241, 223, 223, 1),
                                RevenueIcon(size: size.width * 0.06),
                                "\$9745",
                                "Revenue"),
                          ),
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

  Row salesRevenueBar(CircularWidgetState data) {
    return Row(
      children: [
        Container(
            height: size.width * 0.15,
            width: size.width * 0.15,
            decoration: BoxDecoration(
              color: data.color,
              shape: BoxShape.circle,
            ),
            child: Center(child: data.icon)),
        const Spacer(flex: 1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.bottomText,
              style: TextStyle(
                  fontSize: size.width * 0.0035 * 15,
                  fontWeight: FontWeight.bold),
            ),
            Text("Since last week",
                style: TextStyle(
                    fontSize: size.width * 0.0035 * 12.5,
                    color: Colors.grey[700]!))
          ],
        ),
        const Spacer(flex: 2),
        Text(data.mainText,
            style: TextStyle(
                fontSize: size.width * 0.0035 * 20,
                fontWeight: FontWeight.bold))
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

  Stack showGraph() {
    return Stack(children: [
      LineGraphImage(width: size.width * 0.8),
      Positioned(
        top: size.height * 0.175,
        child: Container(
          width: size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              period("1D"),
              selectedPeriod("1W"),
              period("1M"),
              period("3M"),
              period("6M"),
              period("9M"),
              period("1Y"),
            ],
          ),
        ),
      )
    ]);
  }

  Container selectedPeriod(String text) {
    return Container(
      width: size.width * 0.15,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.035),
        color: const Color.fromRGBO(192, 222, 220, 1),
      ),
      child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: size.width * 0.0035 * 12.5, color: Colors.black))),
    );
  }

  Text period(String text) {
    return Text(text,
        style: TextStyle(
            fontSize: size.width * 0.0035 * 12.5, color: Colors.grey[700]!));
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
