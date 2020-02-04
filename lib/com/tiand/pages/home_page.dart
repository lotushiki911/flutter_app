import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController typeController = TextEditingController();

  String showText = '欢迎你~';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('主页'),),
        body: Container(
          //列布局
          child: Column(
            children: <Widget>[
              //文本框小部件
              TextField(
                //控制器
                controller: typeController,
                //修饰器
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '产品选择', //提示下
                  helperText: '请输入', //下方提示
                ),
                //自动对焦 关闭
                autofocus: false,
              ),
              RaisedButton(
                onPressed: _choiceAction,
                child: Text('选择完毕'),

              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis, //过长显示省略号
                maxLines: 1,//最长显示1行
              )
            ],
          ),
        ),
      ),
    );
  }

  void _choiceAction(){
    print('开始选择----');
    if(typeController.text.toString().isEmpty 
      ||typeController.text.toString() == '' ){
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('类型不能为空'),)
      );
    }else{
      print(typeController.text);
//      getHttp(typeController.text.toString())
//        .then((val){ //val是gethttp返回的数据
//          setState(() {
//            showText = val['data']['name'].toString();
//          });
//      });
      setState(() {
        showText = typeController.text;
      });

    }
  }

  Future getHttp(String text) async{
    try{
      Response response;
      //参数
      var data ={'name': text};
      var url ='https://www.easy-mock.com/mock/5e3974fdf35d4261222b3145/tiand/query';
      response = await Dio().get(url,
        queryParameters: data
      );
      print(response.data);
      return response.data;
    }catch(e){
      print(e);
    }
  }

}
