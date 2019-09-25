import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/utils/rating_star.dart';

class ScoreStarWidget extends StatefulWidget {
  final score; // 评分
  final p5; // 五星评价百分比
  final p4;
  final p3;
  final p2;
  final p1;

  const ScoreStarWidget(
      {Key key, this.score, this.p5, this.p4, this.p3, this.p2, this.p1})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScoreStarWidget();
  }
}

class _ScoreStarWidget extends State<ScoreStarWidget> {
  @override
  Widget build(BuildContext context) {
    var lineW;
    lineW = MediaQuery.of(context).size.width / 3;
    Row titleRow = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            '豆芽评分',
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: Color(0x66ffffff),
          size: 26.0,
        ),
      ],
    );

    Widget getStarts(int count) {
      List<Icon> list = [];
      for (var i = 0; i < count; i++) {
        list.add(Icon(
          Icons.star,
          size: 9.0,
          color: Colors.white70,
        ));
      }

      return Row(
        children: list,
      );
    }

    Widget getLine(double percent) {
      return Stack(
        children: <Widget>[
          Container(
            width: lineW,
            height: 7.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0x13000000),
            ),
          ),
          Container(
            width: lineW * percent,
            height: 7.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color.fromARGB(255, 255, 170, 71),
            ),
          ),
        ],
      );
    }

    // 星星评分比例
    startsLine(int startCount, double percent) {
      if (percent == null || percent.isNaN) {
        percent = 0.0;
      }
      return Padding(
        padding: EdgeInsets.only(bottom: 2.0),
        child: Row(
          children: <Widget>[
            getStarts(startCount),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
            ),
            getLine(percent)
          ],
        ),
      );
    }

    Row scoreRow = Row(
      children: <Widget>[
        Padding(
          child: Column(
            children: <Widget>[
              Text(
                '${widget.score}',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              RatingBar(
                widget.score,
                size: 11.0,
                fontSize: 0.0,
              )
            ],
          ),
          padding: EdgeInsets.only(left: 30.0, right: 10.0),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            startsLine(5, widget.p5),
            startsLine(4, widget.p4),
            startsLine(3, widget.p3),
            startsLine(2, widget.p2),
            startsLine(1, widget.p1),
          ],
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.all(13.0),
      child: Container(
        child: Column(
          children: <Widget>[
            titleRow, // 标题
            scoreRow, // 分数
          ],
        ),
      ),
    );
  }
}
