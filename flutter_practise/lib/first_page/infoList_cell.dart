import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_practise/web_page/web_view_page.dart';

class InfoListCell extends StatelessWidget {
  final String itemTitle;
  final String itemUrl;
  final String itemFromName;
  final int index;

  const InfoListCell(
      {Key key, this.itemTitle, this.itemUrl, this.itemFromName, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.itemUrl.length > 0) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) {
            return WebViewPage(this.itemUrl, this.itemTitle);
          }));
        } else {
          print('url为空');
        }
      },
      child: Container(
        color: Colors.grey,
        // height: 100,
        padding: EdgeInsets.all(5.0),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.white,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // DecoratedBox(
                      //   decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5.0)),
                      //   child: RotatedBox(
                      //     quarterTurns: 1,
                      //     child: Text(this.itemTitle)
                      //   ),
                      // ),
                      // Transform.translate(
                      //   offset: Offset(10.0, 5.0),
                      //   child: Text(this.itemTitle),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 5.0, left: 10.0),
                      //   child: Text(this.itemTitle),
                      // ),
                      Container(
                        margin: EdgeInsets.all(60), //容器外填充
                        // padding: EdgeInsets.all(60.0), // 容器内填充
                        constraints: BoxConstraints.tightFor(
                            width: 200.0, height: 150.0), //卡片大小
                        decoration: BoxDecoration(
                            //背景装饰
                            gradient: RadialGradient(
                                //背景径向渐变
                                colors: [Colors.red, Colors.orange],
                                center: Alignment.centerRight,
                                radius: 1.3),
                            boxShadow: [
                              //卡片阴影
                              BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 4.0)
                            ]),
                        transform: Matrix4.rotationZ(.1), //卡片倾斜变换
                        alignment: Alignment.center, //卡片内文字居中
                        child: Text(
                          //卡片文字
                          "5.20",
                          style: TextStyle(color: Colors.white, fontSize: 40.0),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 5.0, left: 10.0, bottom: 5.0),
                        child: Text(this.itemFromName),
                      ),
                    ],
                  ),
                ),

                // SizedBox(width: 10, height: 10,),

                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
