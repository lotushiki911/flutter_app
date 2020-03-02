import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/httpHeaders.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String _categoryText = '欢迎';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('测试一下子'),),
          body: SingleChildScrollView(
            child:Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _controlButton,
                    child: Text('点我'),
                  ),
                  Text(_categoryText)
                ],
              ),
            )
          )
      ),
    );
  }

  void _controlButton(){
    getHttp().then((onValue){
      setState(() {
        print('---onValue:');
        print(onValue);
//        _categoryText = onValue;
        _categoryText = onValue.toString();
      });
    });
  }
//  //使用请求头访问https
//  Future getHttp() async{
//    Response response ;
//    Dio dio = Dio();
//    dio.options.headers = httpHeaders;
//    var url = 'http://47.103.208.185:8088/hi';
//    //获取网站的返回数据data数据
//    var url1= 'https://time.geekbang.org/serv/v1/column/newAll';
//    response = await dio.get(url1);
//    print(response.data);
//    return response.data;
//  }

  Future getHttp() async{
    Response response ;
    Dio dio = Dio();
    //dio.options.headers = httpHeaders;
    var url = 'http://10.0.2.2:5000/news/test/hehe';
    //获取网站的返回数据data数据
//    var url1= 'https://time.geekbang.org/serv/v1/column/newAll';
    response = await dio.get(url);
    print(response);
    return response;
  }
}


