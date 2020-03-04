import 'package:flutter/material.dart';
import 'com/tiand/pages/index_page.dart';
import 'package:provide/provide.dart';
import 'com/tiand/provide/counter.dart';
import 'com/tiand/provide/child_category.dart';


void main() {
  var counter = Counter();
  var childCategory = ChildCategoryProvide();
  var providers = Providers();
  //注册 监听提供者
  providers..provide(Provider<Counter>.value(counter))
           ..provide(Provider<ChildCategoryProvide>.value(childCategory));
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