import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:flutter_app/com/tiand/provide/home_info_provide.dart';
import 'package:flutter_app/com/tiand/routers/routers_application.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';


class HotGoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle(),
          _wrapList(context),
        ],
      ),
    );
  }

  //流式布局设置火爆专区 标题
  Widget _hotTitle(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.all(5.0),
      color: Colors.transparent,
      child: Text(
        '什么值得买',
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  //构建流式布局体
  Widget _wrapList(context){
    var hotGoodList = Provider.of<HomeInfoProvide>(context).huoList;
    if(hotGoodList.length != 0 ){
      //将List<Map> 转变为流式布局需要的List<Widget>
      List<Widget> widgetList = hotGoodList.map((val){
        return InkWell(
          onTap: (){
            //使用fluro路由跳转详情页
            print(val.toString());
            RoutersApplication.router.navigateTo(context, '/detail?id=5e649dbc98753386658a75ac');
          },
          //每个container包含 一个图片 一个名称  一个价格
          child: Container(
            width: ScreenUtil().setWidth(375),
            color: Colors.white12,
            padding: EdgeInsets.all(3.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                //图片
                getNetWorkImage(val.staticUrl),
                //名称
                Text(
                  val.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(20)),
                ),
                //价格
                Row(
                  children: <Widget>[
                    Text('￥${val.price}',style: TextStyle(color: Colors.red),),
                    Text(
                      '￥2000',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough
                      ),)
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      //返回一个流式布局组件
      return Wrap(
        //每行2个元素
        spacing: 2,
        //待传入的List<Widget>
        children: widgetList,
      );
    }else{
      return Text('没有更多了...');
    }
  }
}
