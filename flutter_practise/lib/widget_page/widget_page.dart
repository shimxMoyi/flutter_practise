import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'widget_page_title.dart';
import 'score_star.dart';

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
  List channelList = [
    '主旋律爱国',
    '历史',
    '毛主席',
    '新中国',
    '正能量',
    '中国大陆',
    '2019',
    '战争',
    '革命',
    '剧情',
    '龙傲天'
  ];

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
            widgetPageTitle(), // 标题
            ScoreStarWidget(
              score: 4.5,
              p1: 0.2,
              p2: 0.5,
              p3: 0.1,
              p4: 0.2,
              p5: 0.3,
            ), // 评分
            tagsContainer(), // 标签
            synopsisContainer(), // 剧情简介
          ],
        ),
      ),
    );
  }

  // 所属频道
  Container tagsContainer() {
    var listView = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: channelList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                '所属频道',
                style: TextStyle(color: Colors.white70, fontSize: 13.0),
              ),
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                channelList[index - 1],
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ),
          );
        }
      },
    );
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: listView,
      height: 30.0,
      // color: Colors.white,
    );
  }

  // 剧情简介
  Container synopsisContainer() {
    return Container(
      height: 300,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              '剧情简介',
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
          ),
          Expanded(
            child: Text(
            '1949年，党中央领导人进驻北京香山，在国共和谈破裂的千钧一发之际，全力筹划建立新中国。1949年，党中央领导人进驻北京香山，在国共和谈破裂的千钧一发之际，全力筹划建立新中国。1949年，党中央领导人进驻北京香山，在国共和谈破裂的千钧一发之际，全力筹划建立新中国。1949年，党中央领导人进驻北京香山，在国共和谈破裂的千钧一发之际，全力筹划建立新中国。',
            style: TextStyle(color: Colors.white70, fontSize: 14.0),
          ),
          ),
          
        ],
      ),
    );
  }
}
