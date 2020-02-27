import 'package:flutter/cupertino.dart'; //ios 风格
import 'package:flutter/material.dart';  //google 风格
import './pageRely/page_list.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  //首页底部导航栏列表
  final List<BottomNavigationBarItem> bottomTabs = bottomTabList;
  // 底部导航栏对应页面列表
  final List tabBodies = tabBodyList;
  // 当前主页面编码
  int currentIndex = 0;
  //当前主页面
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      //展现的哪个页面
      body: currentPage,
      //底部导航设置
      bottomNavigationBar: BottomNavigationBar(
        //底部导航栏主背景色设置
        backgroundColor: Color.fromARGB(255, 245, 245, 1),
        //底部导航栏风格设置
        type: BottomNavigationBarType.fixed,
        //设置当前选中的底部导航栏的编码
        currentIndex: currentIndex,
        //底部导航栏主体
        items: bottomTabs,
        //点击事件
        onTap: (index){
          setState(() {
            //点击后选中那个就更新我们的页面
            currentIndex = index;
            //更新选中的页面
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
    );
  }
}

