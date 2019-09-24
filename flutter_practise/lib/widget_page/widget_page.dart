import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widget_page_title.dart';

class WidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetPage();
  }
}

class _WidgetPage extends State<WidgetPage> {
  // 转盘container
  // Container dialContainer = Container(
  //   child: Container(
  //     width: 200,
  //     height: 200,
  //   ),
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.all(Radius.circular(100)),
  //     color: Colors.red
  //   ),
  // );
  // Widget topTitle = widgetPageTitle();

  @override
  Widget build(BuildContext context) {
    var bgColor = Color(0xff290a04);
    return Scaffold(
      appBar: AppBar(
        title: Text('电影'),
        backgroundColor: bgColor,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        ),
      body: Container(
        alignment: Alignment.center,
        color: bgColor,
        child: Column(
          children: <Widget>[
            widgetPageTitle(),
          ],
        ),
      ),
    );
  }
}
