import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/home_info_model.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:flutter_app/com/tiand/provide/home_info_provide.dart';
import 'package:flutter_app/com/tiand/routers/routers_application.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';


/// 楼层组件 -
class FloorTitle extends StatelessWidget {
  final String pic_address;
  FloorTitle({Key key,this.pic_address}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: getNetWorkImage(pic_address),
    );
  }
}

/// 楼层组件 - 2 商品列表
class FloorContentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var titleList = Provider.of<HomeInfoProvide>(context).floorTitleList;
    var floorList = Provider.of<HomeInfoProvide>(context).floorContentList;
    return Container(
      //将每层楼层组合起来
      child: Column(
        children: <Widget>[
          // 1 标题
          Container(

            padding: EdgeInsets.all(8.0),
            child: getNetWorkImage(titleList[0].staticUrl),
          ),
          //2 商品列表
          _firstRow(context,floorList),
          _secondRow(context,floorList),
        ],
      ),
    );
  }

  //定义单个模组
  Widget _goodsItem(context,HomeData floorData,int width,int height){
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setHeight(height),
      child: InkWell(
        onTap: (){
//          print('楼层商品详情');
          RoutersApplication.router.navigateTo(context, '/detail?id=lunbo1');

        },
        child: getNetWorkImage(floorData.staticUrl),
      ),
    );
  }

  // 第一行楼层组建
  Widget _firstRow(context,floorList){
    return Row(
      children: <Widget>[
        //左边是一个大的
        _goodsItem(context,floorList[0],384,384),
        //右边是两个小的 需要使用column
        Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  _goodsItem(context,floorList[1],192,192),
                  _goodsItem(context,floorList[2],192,192),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  _goodsItem(context,floorList[3],192,192),
                  _goodsItem(context,floorList[4],192,192),
                ],
              ),
//
            ),
          ],
        )
      ],
    );
  }

  //第二行楼层组件
  Widget _secondRow(context,floorList){
    return Row(
      children: <Widget>[
        //左边是一个大的
        _goodsItem(context,floorList[5],384,200),
        //右边是两个小的 需要使用column
        _goodsItem(context,floorList[6],384,200),
      ],
    );
  }

}
