import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/service/service_method.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    // TODO: implement initState
//    _getCateGory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _getCateGory();
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('测试一下子'),),
          body: Container(
              child: Text('hehe'),
          )
      ),
    );
  }

  void _getCateGory() async{
    await getHomePageImg(servicePath['categoryPageInfo']).then((val){
      print('分类数据获取${val}');
    });
  }
}


