import 'package:flutter/material.dart';

class widgetPageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenW = MediaQuery.of(context).size.width;
    var imgW = screenW / 4;
    var imgH = imgW * 421 / 297;
    var btnW = (screenW * 3 / 4 - 40) / 2;
    var btnH = 35.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Container(
            width: imgW,
            height: imgH,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://upload-images.jianshu.io/upload_images/3459828-e0947c5d9b0c555a.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '决胜时刻',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('(2019)',
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
                  child: Text('中国大陆/剧情传记历史/上映时间：\n2019-09-20(中国大陆)/片长：140分钟',
                      style: TextStyle(fontSize: 12.0, color: Colors.white70)),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      width: btnW,
                      height: btnH,
                      child: FlatButton.icon(
                        icon: Icon(Icons.rowing),
                        label: Text('想看'),
                        textColor: Colors.black,
                        color: Colors.white,
                        highlightColor: Colors.white,
                        onPressed: () {
                          print('点击了想看');
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Container(
                      width: btnW,
                      height: btnH,
                      child: FlatButton.icon(
                        icon: Icon(Icons.leak_add),
                        label: Text('看过'),
                        textColor: Colors.black,
                        color: Colors.white,
                        highlightColor: Colors.white,
                        onPressed: () {
                          print('点击了看过');
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
