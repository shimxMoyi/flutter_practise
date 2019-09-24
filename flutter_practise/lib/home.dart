import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/about_Page/about_Page.dart';
import 'package:flutter_practise/user_page/user_page.dart';
import 'package:flutter_practise/widget_page/widget_page.dart';
import 'package:flutter_practise/first_page/main_page.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageSate();
  }
}

class _MyHomePageSate extends State<AppPage> {
  int _currentIndex = 0;
  String appBarTitle;
  List<Widget> _list = List();
  List tabData = [
    {'text': '业界动态', 'icon': Icon(Icons.language)},
    {'text': '分歧终端', 'icon': Icon(Icons.device_hub)},
    {'text': '关于', 'icon': Icon(Icons.import_contacts)},
    {'text': '个人', 'icon': Icon(Icons.account_circle)}
  ];
  List<BottomNavigationBarItem> _myTabs = List();
  // @override
  @override
  void initState() {
    super.initState();
    // 这里可以做初始化操作
    appBarTitle = tabData[0]['text'];
    // 创建tabbarItem
    for (var i = 0; i < tabData.length; i++) {
      BottomNavigationBarItem _barItem = new BottomNavigationBarItem(
          icon: tabData[i]['icon'], title: Text(tabData[i]['text']));
      _myTabs.add(_barItem);
    }

    // 对应的路由
    _list
      ..add(MainPage())
      ..add(WidgetPage())
      ..add(AboutPage())
      ..add(UserPage());

    print(_list);
  }

  renderAppBar(BuildContext context, int index, String titleString) {
    if (index != 0 && index != 1) {
      return AppBar(title: Text(titleString));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(context, _currentIndex, appBarTitle),
      bottomNavigationBar: CupertinoTabBar(
        items: _myTabs,
        currentIndex: _currentIndex,
        onTap: _itemTapped,
      ),
      body: IndexedStack(
        index: _currentIndex,
        // children里的widget必须全部实现，不能有返回null的情况。
        children: _list,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }
}
