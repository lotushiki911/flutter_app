import 'package:flutter/cupertino.dart'; //ios 风格
import 'package:flutter/material.dart';  //google 风格
//引入底部导航栏的分类页面
import 'home_page.dart';
import 'member_page.dart';
import 'cart_page.dart';
import 'category_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  //底部导航栏保存列表  每一个子项包含一个图标和文字
  final List<BottomNavigationBarItem> bottomTabs = [
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
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text('我的')
    )
  ];

  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  int currentIndex = 0;
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
      //脚手架自带底部导航
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        //点击事件
        onTap: (index){
          setState(() {
            currentIndex = index; //点击后选中那个就更新我们的页面
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      //展现的哪个页面
      body: currentPage,
    );
  }
}

