import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';

//路由 商品详情页
Handler detailsPageHandler = Handler(
  //属性 固定写法
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    print('index>detail good id :${goodsId}');
    //如果找到符合要求的数据 则返回对应的页面
    return DetailsPage(goodsId);
  }
);


