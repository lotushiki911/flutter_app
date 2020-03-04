import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../model/product_category_model.dart';
import '../provide/child_category.dart';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    // TODO: implement initState
//    _getCateGory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('分类'),),
          body: Container(
              //分为左右两块 所有用row
              child: Row(
                children: <Widget>[
                  LeftCategoryNav(),
                  //右侧分为上下结构 上面是一排导航 下面是内容呈现
                  Column(
                    children: <Widget>[
                      RightCategoryNav(),
                    ],
                  ),
                ],
              ),

          )
      ),
    );
  }
}

//左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  //保存获取的大类列表
  List<ProductData> leftList = [];

  //点击高亮显示
  int indexClick = 0;
  @override
  void initState() {
    _getCateGory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1,color: Colors.black12)
        )
      ),
      //动态列表 使用构造器
      child: ListView.builder(
        //个数
        itemCount: leftList.length,
        itemBuilder: (context,index){
          return _leftInkWell(index);
        },
      ),

    );
  }

  //页面布置 - 左边类别导航
  Widget _leftInkWell(int index){
    bool isClick = false;
    isClick = indexClick == index ? true : false;

    return InkWell(
      onTap: (){
        setState(() {
          indexClick = index;
        });
        //绑定provide进行左右侧导航栏联动改变
        var childList = leftList[index].subProductSet;
        Provide.value<ChildCategoryProvide>(context).getChildCategory(childList);
      },
      child: Container(
        //设置高度
        height: ScreenUtil().setHeight(80),
        //设置边距
        padding: EdgeInsets.only(left: 10,top: 10),
        //大类的名称
        child: Text(
          leftList[index].productCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
        //装饰器
        decoration: BoxDecoration(
          //点击高亮
          color: isClick?Colors.yellow : Colors.white,
          //包边
          border: Border(
            bottom: BorderSide(
                width: 1,
                color: Colors.black12
            )
          )
        ),

      ),
    );
  }

  //获取类别数据
  void _getCateGory() async{
    print('获取分类页信息');
    await getHomePageImg(servicePath['categoryPageInfo']).then((val){
      var data = json.decode(val.toString());
      print(data);
      ProductCategory productCategory = ProductCategory.fromJson(data);
      //将后台获取的大类数据  在页面动态显示
      setState(() {
        leftList = productCategory.productData;
      });
    });
  }


}


//右侧分类导航 --顶部
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
//  List list = ['全部','美食','宝宝','旅游','玩具','气球','火车','飞机','外星人'];
  @override
  Widget build(BuildContext context) {
    //引入状态改变数据
    return Provide<ChildCategoryProvide>(
      builder: (context,child,childCategory){
        return Container(
          //右侧的模块
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(608),
          //加个底框
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1,color: Colors.black12
                  )
              )
          ),
          //改为横向布局
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: childCategory.subProductList.length,
              itemBuilder: (context,index){
                return _rightInkWell(childCategory.subProductList[index]);
              }
          ),
        );
      },
    );
  }
  //右侧的小组件 构建
  Widget _rightInkWell(SubProductSet item){
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
            item.subProductName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(24),
            color: Colors.black,
          ),

        ),
      ),
    );

}
}
