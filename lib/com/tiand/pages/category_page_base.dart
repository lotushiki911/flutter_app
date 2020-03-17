import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/pages/categorys_page/category_goods_list.dart';
import 'package:flutter_app/com/tiand/pages/categorys_page/left_category_nav.dart';
import 'package:flutter_app/com/tiand/pages/categorys_page/right_category_nav.dart';
import 'package:flutter_app/com/tiand/provide/category_provide.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('分类页面'),),
      body: FutureBuilder(
        future: _getCategoryInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
              return Container(
                //分为左右两块 所有用row
                child: Row(
                  children: <Widget>[
                    LeftCategoryNav(),
                    //右侧分为上下结构 上面是一排导航 下面是内容呈现
                    Column(
                      children: <Widget>[
                        RightCategoryNav(),
                        CategoryGoodsList(),
                      ],
                    ),
                  ],
                ),
              );
          } else {
            return Text('正在加载中');
          }
        },
      ),
    );
  }
  //provide必须要上下文才能使用
  Future _getCategoryInfo(BuildContext context) async{
    //获取左侧大类 右侧小类 数据
    await Provider.of<CategoryProvide>(context,listen: false).getCategoryFirstTime();

    //获取右侧商品列表 数据
    var data={
      //大类项
      'categoryId': '1',
      //小项id
      'categorySubId': '',
      //分页数
      'page': 1,
    };
    await Provider.of<CategoryProvide>(context,listen: false).getGoodsList(data);

    return '完成加载';
  }

}

