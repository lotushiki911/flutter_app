//import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/provide/cart_provide.dart';
import 'package:flutter_app/com/tiand/provide/current_index_provide.dart';
import 'package:provider/provider.dart';
import 'com/tiand/pages/index_page.dart';
import 'com/tiand/provide/category_provide.dart';
import 'com/tiand/provide/category_goods_provide.dart';
import 'com/tiand/provide/child_category_provide.dart';
import 'com/tiand/provide/goods_detail_provide.dart';
import 'package:fluro/fluro.dart';
import './com/tiand/routers/routers.dart';
import './com/tiand/routers/routers_application.dart';
import 'com/tiand/provide/home_info_provide.dart';

void main() => runApp(
  //provide4.0注册
  MultiProvider(
    providers: [
      //购物车provider注册
      ChangeNotifierProvider.value(value: CartProvide()),
      ChangeNotifierProvider.value(value: CurrentIndexProvide()),
      ChangeNotifierProvider.value(value: GoodDetailProvide()),
      ChangeNotifierProvider.value(value: ChildCategoryProvide()),
      ChangeNotifierProvider.value(value: CategoryGoodsProvide()),
      ChangeNotifierProvider.value(value: CategoryProvide()),
      ChangeNotifierProvider.value(value: HomeInfoProvide()),
    ],
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //初始化 路由
    final router = Router();
    //注入
    Routers.configureRouters(router);
    //静态化
    RoutersApplication.router = router;

    return Container(
        child: MaterialApp(
          title: '买买买',
          onGenerateRoute: RoutersApplication.router.generator,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.pinkAccent
          ),
          home: IndexPage(),
        )
    );
  }
}