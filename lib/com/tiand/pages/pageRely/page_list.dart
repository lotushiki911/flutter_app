import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//引入底部导航栏的分类页面
import '../home_page.dart';
import '../member_page.dart';
import '../cart_page.dart';
import '../category_page.dart';
import '../news_page.dart';

//首页底部导航栏保存列表  每一个子项包含一个图标和文字
final List<BottomNavigationBarItem> bottomTabList = [
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home,
        //color: Colors.lightGreen,
      ),
      title: Text('首页')
  ),
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
  ),
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
  ),
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.info),
      title: Text('快讯')
  ),
  BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('我的')
  )
];
//底部导航栏包含的页面内容
final List<Widget> tabBodyList = [
  HomePage(),
  CategoryPage(),
  CartPage(),
  NewsPage(),
  MemberPage()
];

Widget getNetWorkImage(String path){
  String url = serviceUrlStatic + path;
  return Image.network(url);
}

Widget getNetWorkImageWithWH(String path,width,height){
  String url = serviceUrlStatic + path;
  return Image.network(url,
    width: ScreenUtil().setWidth(width),
    height: ScreenUtil().setHeight(height),);
}