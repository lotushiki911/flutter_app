import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/home_info_model.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:flutter_app/com/tiand/provide/home_info_provide.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

/// 中部类别导航组件
class MidNavigatorPage extends StatelessWidget {
//  final List navigatorList ;
//  MidNavigator(this.navigatorList);

  ///构建一个小组件
  Widget _gridViewItemUI(BuildContext context,HomeData item){
    /// 小组件
    return InkWell(
      //单击事件
      onTap: (){
        print('点击');
      },
      child: Column(
        children: <Widget>[
          getNetWorkImageWithWH(item.staticUrl,118,118),
          Text(item.staticName)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeInfoProvide>(
      builder: (context,val,_){
        return Container(
          height: ScreenUtil().setHeight(400),
          //内距
          padding: EdgeInsets.all(2.5),
          //设置网格列表狮子
          child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              //每行4各
              crossAxisCount: 4,
              padding: EdgeInsets.all(5.0),
              children: val.naviList.map((item){
                return _gridViewItemUI(context, item);
              }).toList()
          ),
        );
      },
    );
  }
}