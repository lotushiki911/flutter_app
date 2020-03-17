import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/goods_detail_model.dart';
import 'package:provider/provider.dart';
//import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoodDetailProvide>(
      builder: (context,val,_){
        var left = val.isLeft;
        var right = val.isRight;
        return Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Row(
            children: <Widget>[
              _tabBarLeft(context,left),
              _tabBarRight(context,right),
            ],
          ),
        );
      },
    );
  }

  //tabbar组件--左
  Widget _tabBarLeft(BuildContext context,bool isLeft){
    return InkWell(
      //点击切换左右tabbar
      onTap: (){
        Provider.of<GoodDetailProvide>(context).changeLeftOrRight('left');
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(360),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isLeft? Colors.deepOrange:Colors.black12,
            )
          )
        ),
        child: Text(
          '详情',
          style: TextStyle(
            color: isLeft? Colors.deepOrange:Colors.black,
          ),
        ),
      ),
    );
  }

  //tabbar组件--右边
  Widget _tabBarRight(BuildContext context,bool isRight){
    return InkWell(
      //点击切换左右tabbar
      onTap: (){
        Provider.of<GoodDetailProvide>(context).changeLeftOrRight('right');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(360),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: isRight? Colors.deepOrange:Colors.black12,
                )
            )
        ),
        child: Text(
          '评论',
          style: TextStyle(
            color: isRight? Colors.deepOrange:Colors.black,
          ),
        ),
      ),
    );
  }
}
