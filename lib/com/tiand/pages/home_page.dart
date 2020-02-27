import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../tools/ToolDart.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController textController = TextEditingController();
  String showText = '欢迎你';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('买买买'),),
        //不要跟listview一起用
//        body: SingleChildScrollView(
//          child: Text(homePageContent),
//        ),
          body: Container(
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
                    child: Text('选择完毕'),
                ),
                Text(
                  showText,
                  //显示省略号
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
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
          print('返回的数据为${val}');
           showText = val;
        });

      });
    }
  }
}
