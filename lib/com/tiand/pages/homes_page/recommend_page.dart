import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/home_info_model.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:flutter_app/com/tiand/provide/home_info_provide.dart';
import 'package:flutter_app/com/tiand/routers/routers_application.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

/// 商品推荐
class RecommendPage extends StatelessWidget {


  // 主方法
  @override
  Widget build(BuildContext context) {
    var recommendList = Provider.of<HomeInfoProvide>(context).recommendList;
    return Container(
      height: ScreenUtil().setHeight(450),
      //外边距
      margin: EdgeInsets.only(top: 5.0),
      //组合 标题 和 横向列表
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList(recommendList),
        ],
      ),
    );
  }

  //标题方法
  Widget _titleWidget(){

    return Container(
      //对齐
      alignment: Alignment.centerLeft,
      //四边设置对齐模式
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      //
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width: 0.5,color: Colors.black12)
          )
      ),
      child: Text(
        '秒杀',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //横向列表 用来排列每行的 小部件
  Widget _recommedList(recommendList){
    return Container(
      height: ScreenUtil().setHeight(340),
      //设置横向 布局
      child: ListView.builder(
        //横轴模式
        scrollDirection: Axis.horizontal,
        //数量
        itemCount: recommendList.length,
        itemBuilder: (context,index){
          return _item(context,recommendList[index]);
        },
      ),
      //外边距
//      margin: EdgeInsets.only(top: 10.0),

    );
  }


  //商品单独项方法  跳转到详情页
  Widget _item(context,HomeData recommendInfo,){
    return InkWell(
      onTap: (){
        print('商品详情');
        RoutersApplication.router.navigateTo(context, '/detail?id=ed675dda49e0445fa769f3d8020ab5e8');
      },
      child: Container(
        height: ScreenUtil().setHeight(300),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(5.0),
        //箱式装饰器
        decoration: BoxDecoration(
            color: Colors.white,
            //边界定义
            border:Border(
              left: BorderSide(width: 1, color: Colors.black12),

            )
        ),
        child: Column(
          //每个小项 由三个内容组成: 图标,商品价格,源价格
          children: <Widget>[
            getNetWorkImage(recommendInfo.staticUrl),
            Text(
              '￥${recommendInfo.newPrice}',
              style: TextStyle(
                  color: Colors.redAccent
              ),
            ),
            Text(
              '￥${recommendInfo.oldPrice}',
              style: TextStyle(
                //删除线
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey
              ),
            )

          ],

        ),
      ),
    );
  }




}
