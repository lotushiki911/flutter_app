import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();

Widget classFooter(){
  return ClassicsFooter(
    key: _footerkey,
    bgColor: Colors.white,
    textColor: Colors.pink,
//加载时候的颜色
    moreInfoColor: Colors.pink,
//是否加载更多
    showMore: true,
    noMoreText: '',
    moreInfo: '加载中',
    loadedText: '呵呵呵',
    loadingText: '加载完成',
//准备文字
    loadReadyText: '准备加载...',
    loadText: '加载...',);
}