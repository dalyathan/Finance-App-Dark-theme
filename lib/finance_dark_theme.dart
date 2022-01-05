import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_clipper.dart';

class FinanceDarkTheme extends StatelessWidget {
  FinanceDarkTheme({Key? key}) : super(key: key);

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
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: specialThemeData,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform(
                          alignment: FractionalOffset.center,
                          transform: new Matrix4.identity()
                            ..rotateZ(-90 * 3.1415927 / 180),
                          child: ClipPath(
                              clipper: CustomTriangleClipper(),
                              child: Icon(
                                Icons.menu,
                                size: size.height * 0.045,
                              )))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
