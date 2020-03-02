import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  TextEditingController textController = TextEditingController();
  String showText = '快讯搜索';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('新闻快讯'),),
        //不要跟listview一起用
        //可以解决 像素超长 超出屏幕界限的问题
//        body: SingleChildScrollView(
//          child: Text(homePageContent),
//        ),
        body: SingleChildScrollView(
          child:  Container(
          //列式布局
          child: Column(
            children: <Widget>[
              TextField(
                controller: textController,
                //聚焦
                autofocus: false,
                //修饰器
                decoration: InputDecoration(
                  //边距
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '查询',
                  helperText: '请输入查询',
                ),
              ),
              RaisedButton(
                onPressed: _choiceAction,
                child: Text('查询'),
              ),

              Text(
                showText,
                //显示省略号
//                overflow: TextOverflow.ellipsis,
//                maxLines: 1,
              )
            ],
          ),
        ),)
      ),
    );
  }

  //定义点击事件
  void _choiceAction(){
    print('开始选择----->');
    if(textController.text.toString() == ''){
      //如果为空的话显示提示
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('输入内容不能为空'),)
      );
    }else{
      var data = {'name': textController.text.toString()};
      getHomePageContent('homePageInfoByName',data).then((val){
        setState(() {
          print('狮子返回的数据为${val}');
          if (val == ''){
            showText = '没有查询到数据';
          }else{
            Map<String, dynamic> news = json.decode(val);
            showText = news['item_info'];
          }
        });

      });
    }
  }
}


