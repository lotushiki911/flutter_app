import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/goods_detail_model.dart';
//import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsExplainArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      width: ScreenUtil().setWidth(700),
      padding: EdgeInsets.all(10.0),
      child: Text(
        '说明: > 好东西 > 正品保证',
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: ScreenUtil().setSp(30),

        ),
      ),
    );
  }
}
