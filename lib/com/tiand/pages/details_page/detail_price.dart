import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/goods_detail_model.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodDetailProvide>(
        builder: (context, child, goodDetail) {
          DetailInfo detailInfo = goodDetail.detailsModel.detailData.detailInfo;
          if (detailInfo != null) {
            return Container(
              child: Row(
                children: <Widget>[
                  _leftPrice(detailInfo.presentPrice),
                  _rightPrice(detailInfo.oriPrice),
                ],
              ),
            );
          } else {
            return Text('暂时没有详情数据');
          }
        }
    );
  }

  // 左边的价格显示
  Widget _leftPrice(price){
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Text(
        '￥${price.toString()}',
        style: TextStyle(
          color: Colors.red,
          fontSize: ScreenUtil().setSp(35),
        ),
      ),
    );
  }

  //右边的市场价显示
  Widget _rightPrice(price){
    return Container(
      margin: EdgeInsets.only(left: 50),
      child: Row(
        children: <Widget>[
          Text(
            '市场价￥:     ',
            style: TextStyle(
              color: Colors.black45
            ),
          ),
          Text(
            price.toString(),
            style: TextStyle(
              color: Colors.black12,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }
}
