import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'infoList_page.dart';

// DefaultTabController _tabController;
// TabBar _tabBar;

class _Page {
  final String labelId;
  final int labelIndex;

  _Page(this.labelId, this.labelIndex);
}

final List<_Page> _allPage = <_Page>[
  _Page('热门咨询', 1),
  _Page('官网', 2),
  _Page('摇一摇', 3)
];

AppBar _myAppBar = AppBar(
  leading: FlatButton(
    padding: EdgeInsets.all(0),
    child: Container(
      child: Image.network(
        'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658',
        width: 40,
        height: 40,
      ),
    ), 
    onPressed: () {
      pushPersonalPage();
    },
  ),
  centerTitle: true,
  title: _tabBar,
  // title: TabLayout(),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.search),
      onPressed: (){
        pushPage();
      },
    ),
  ],
);

TabBar _tabBar = TabBar (
  isScrollable: false,
      // 这个不是很懂，大概就是把_allPage里的文案转化为文案
  tabs: _allPage.map((_Page page)=>Tab(text: page.labelId)).toList(), 
  indicatorSize: TabBarIndicatorSize.label, // 设置选择指示器的尺寸，有tab和label两种默认尺寸
  labelPadding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
  indicatorColor: Colors.blue,
  labelColor: Colors.yellow,
  unselectedLabelColor: Colors.white,
);

TabBarView _tabbarView = TabBarView(
  children: _allPage.map((_Page page) { //创建3个Tab页
      if (page.labelIndex == 1) {
        return InfoListPage();
      } else {
        return Container(
          alignment: Alignment.center,
          child: Text(page.labelId, textScaleFactor: 5),
      );
      }
      
  }).toList(),
);

DefaultTabController _tabController = DefaultTabController(
  length: _allPage.length,
  child: Scaffold(
    appBar: _myAppBar,
    body: _tabbarView,
  ),
);

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return _tabController; 
  } 
}

/*
class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _tabBar = TabBar(
      isScrollable: false,
      // 这个不是很懂，大概就是把_allPage里的文案转化为文案
      tabs: _allPage.map((_Page page)=>Tab(text: page.labelId)).toList(), 
      indicatorSize: TabBarIndicatorSize.label, // 设置选择指示器的尺寸，有tab和label两种默认尺寸
      labelPadding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
      // onTap: (index) {
      //   switch (index) {
      //     case 0:
      //       print('appbar 跳转0');
      //       break;
      //     case 1:
      //       print('appbar 跳转1');
      //       break;
      //     case 2:
      //       print('appbar 跳转2');
      //       break;
      //     default:
      //   }
      // },
    );
    return _tabBar;
  }
}
*/
void pushPage () {
  print('搜索页面');
}

void pushPersonalPage () {
  print('个人页面');
}