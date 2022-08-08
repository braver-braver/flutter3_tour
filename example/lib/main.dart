import 'package:example/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App 框架',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.w400, color: Colors.black),
          headline3: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w400, color: Colors.black),
          headline4: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w400, color: Colors.black),
          headline6: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w200, color: Colors.black),
          bodyText1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w200,
          ),
        ),
        fontFamily: 'Georgia',
      ),
      home: AppHomePage(),
    );
  }
}
