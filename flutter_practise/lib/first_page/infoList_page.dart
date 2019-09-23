import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';
import 'infoList_cell.dart';
import 'infoList_item.dart';
import 'package:flutter_practise/utils/net_utils.dart';
import 'package:flutter_practise/utils/list_refresh.dart' as listComp;

class InfoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _InfoListPage();
  }
  
}

class _InfoListPage extends State<InfoListPage> with AutomaticKeepAliveClientMixin {
  static const loadingTag = "##loading##"; 
  var _words = <String>[loadingTag];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // _retrieveData();
  }

  @override
  Widget build(BuildContext context) {

    // return ListView.custom(
    //   padding: EdgeInsets.only(bottom: 60),
    //   scrollDirection: Axis.vertical,
    //   childrenDelegate:SliverChildBuilderDelegate((BuildContext context, int index) {
    //       return InfoListCell(
    //         itemTitle: '$index + 这是发的', 
    //         itemFromName: '名字 + $index', 
    //         index: index,
    //       );
    //     }, 
    //   childCount: 100,
    //   ),
    // );
    return listComp.ListRefresh(getIndexListData,cellItem,null);
  }

// cell widget
  Widget cellItem (index, item)  {
    var myTitle = '${item.title}';
    var myUsername = '${'👲'}: ${item.username} ';
    var codeUrl = '${item.detailUrl}';
    return InfoListCell(itemTitle: myTitle, itemFromName: myUsername, itemUrl: codeUrl,);
  }

  // 获取网络数据
  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    /// const juejin_flutter = 'https://timeline-merger-ms.juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
    const juejin_flutter = 'https://fluttergo.pub:9527/juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';

    var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    final _param  = {'page':pageIndex,'pageSize':20,'sort':'rankIndex'};
    var responseList = [];
    var  pageTotal = 0;

    try{
      var response = await NetUtils.get(juejin_flutter, _param);
      responseList = response['d']['entrylist'];
      pageTotal = response['d']['total'];
      if (!(pageTotal is int) || pageTotal <= 0) {
        pageTotal = 0;
      }
    }catch(e){

    }
    pageIndex += 1;
    List resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        InfoListItem cellData = new InfoListItem.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
      }
    }
    Map<String, dynamic> result = {"list":resultList, 'total':pageTotal, 'pageIndex':pageIndex};
    return result; 
  }
}