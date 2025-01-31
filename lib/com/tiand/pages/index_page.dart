import 'package:flutter/cupertino.dart'; //ios 风格
import 'package:flutter/material.dart';  //google 风格
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import './pageRely/page_list.dart';
//import 'package:provide/provide.dart';
import '../provide/current_index_provide.dart';

class IndexPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //初始化设计尺寸
    ScreenUtil.init(context, width: 768, height: 1184);
    return Consumer<CurrentIndexProvide>(
        builder: (context, provide, _) {
          int currentIndex = Provider.of<CurrentIndexProvide>(context,listen: false).currentIndex;
          return Scaffold(
            backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
            //展现的哪个页面
            body: IndexedStack(
              index: currentIndex,
              children: tabBodyList,
            ),
            //底部导航设置
            bottomNavigationBar: BottomNavigationBar(
              //底部导航栏主背景色设置
              backgroundColor: Color.fromARGB(255, 245, 245, 1),
              //底部导航栏风格设置
              type: BottomNavigationBarType.fixed,
              //设置当前选中的底部导航栏的编码
              currentIndex: currentIndex,
              //底部导航栏主体
              items: bottomTabList,
              //点击事件
              onTap: (index) {
//                provide.changeIndex(index);
                Provider.of<CurrentIndexProvide>(context,listen: false).changeIndex(index);
              },
            ),
          );
        }
    );
  }

}

//class IndexPages extends StatefulWidget {
//  @override
//  _IndexPagesState createState() => _IndexPagesState();
//}
//
//class _IndexPagesState extends State<IndexPages> {
//  // 当前主页面编码
//  int currentIndex = 0;
//  //当前主页面
//  var currentPage;
//
//  @override
//  void initState() {
//    currentPage = tabBodyList[currentIndex];
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    //初始化设计尺寸
//    ScreenUtil.init(context, width: 768, height: 1184);
//    return Scaffold(
//      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
//      //展现的哪个页面
////      body: currentPage,
//      body: IndexedStack(
//        index: currentIndex,
//        children: tabBodyList,
//      ),
//      //底部导航设置
//      bottomNavigationBar: BottomNavigationBar(
//        //底部导航栏主背景色设置
//        backgroundColor: Color.fromARGB(255, 245, 245, 1),
//        //底部导航栏风格设置
//        type: BottomNavigationBarType.fixed,
//        //设置当前选中的底部导航栏的编码
//        currentIndex: currentIndex,
//        //底部导航栏主体
//        items: bottomTabList,
//        //点击事件
//        onTap: (index){
//          setState(() {
//            //点击后选中那个就更新我们的页面
//            currentIndex = index;
//            //更新选中的页面
//            currentPage = tabBodyList[currentIndex];
//          });
//        },
//      ),
//    );
//  }
//}

