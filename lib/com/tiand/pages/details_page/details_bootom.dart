import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/model/goods_detail_model.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';


class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Container(
              width: ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              color: Colors.green,
              width: ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(30),
                ),
              )
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
                color: Colors.red,
                width: ScreenUtil().setWidth(320),
                alignment: Alignment.center,
                child: Text(
                  '立即购买',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(30),
                  ),
                )
            ),
          ),
        ],
      ),

    );
  }
}
