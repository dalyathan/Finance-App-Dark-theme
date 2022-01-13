import 'package:flutter/material.dart';

import 'screens/finance_dark_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: specialThemeData,
      home: FinanceDarkTheme(),
    );
  }
}
