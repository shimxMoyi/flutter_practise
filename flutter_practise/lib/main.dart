import 'package:flutter/material.dart';
import 'package:flutter_practise/home.dart';
import 'package:flutter_practise/about_Page/about_Page.dart';
import 'package:flutter_practise/about_Page/about_Page.dart';
import 'package:flutter_practise/widget_page/widget_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int themeColor = 0xFFC91B3A;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Practise',
      theme: ThemeData(
        primaryColor: Color(this.themeColor),
        backgroundColor: Color(0xFF888888),
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(this.themeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(body: showWelcomePage()),
    );
  }

  showWelcomePage() {
    return AppPage();
  }
}
