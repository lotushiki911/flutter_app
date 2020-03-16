import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/provide/cart_provide.dart';
import 'package:flutter_app/com/tiand/provide/current_index_provide.dart';
import 'com/tiand/pages/index_page.dart';
import 'package:provide/provide.dart';
import 'com/tiand/provide/counter.dart';
import 'com/tiand/provide/category_goods_provide.dart';
import 'com/tiand/provide/child_category_provide.dart';
import 'com/tiand/provide/goods_detail_provide.dart';
import 'package:fluro/fluro.dart';
import './com/tiand/routers/routers.dart';
import './com/tiand/routers/routers_application.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategoryProvide();
  var categoryGoods = CategoryGoodsProvide();
  var goodsDetail = GoodDetailProvide();
  var cart = CartProvide();
  var currentIndex = CurrentIndexProvide();
  var providers = Providers();

  //注册 监听提供者
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategoryProvide>.value(childCategory))
    ..provide(Provider<CategoryGoodsProvide>.value(categoryGoods))
    ..provide(Provider<GoodDetailProvide>.value(goodsDetail))
    ..provide(Provider<CartProvide>.value(cart))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndex));

  runApp(ProviderNode(child: MyApp(),providers: providers,));
}

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