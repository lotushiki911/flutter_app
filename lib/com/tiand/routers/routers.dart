import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

//总体路由配置
class Routers{
  //根目录
  static String root ='/';
  //详情页目录
  static String detailsPage = '/detail';
  static void configureRouters(Router router){
    //如果找不到路由 给一个默认路由处理
    router.notFoundHandler = _noFoundHandler();

    //配置 详情页路由
    router.define(detailsPage, handler: detailsPageHandler);
  }

  static Handler _noFoundHandler() {
    return Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('ERROR====>ROUTE NOT FOUND!!!');
      }
    );
  }
}