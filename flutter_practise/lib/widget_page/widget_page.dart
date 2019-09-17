import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetPage();
  }

}

class _WidgetPage extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }

}