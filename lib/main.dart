import 'package:flutter/material.dart';
import 'com/tiand/pages/index_page.dart';
import 'package:provide/provide.dart';
import 'com/tiand/provide/category_goods_provide.dart';
import 'com/tiand/provide/counter.dart';
import 'com/tiand/provide/child_category_provide.dart';


void main() {
  var counter = Counter();
  var childCategory = ChildCategoryProvide();
  var categoryGoods = CategoryGoodsProvide();
  var providers = Providers();
  //注册 监听提供者
  providers..provide(Provider<Counter>.value(counter))
           ..provide(Provider<ChildCategoryProvide>.value(childCategory))
           ..provide(Provider<CategoryGoodsProvide>.value(categoryGoods));
  runApp(ProviderNode(child: MyApp(),providers: providers,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
          title: '买买买',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.pinkAccent
          ),
          home: IndexPage(),
        )
    );
  }
}