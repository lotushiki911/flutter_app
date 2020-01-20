import 'package:flutter/Material.dart';

void main(){
  runApp(MaterialApp(
    title: '页面跳转3',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('页面跳转返回参数主页面'),),
      body: Center(
        child: RouteButton(),
      )
    );
  }
}


class RouteButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: (){_navigateToNextPage(context);},
      child: Text('开始跳转'),
    );
  }
  //响应事件 使用异步等待 导航到下一个页面 等待子页面返回 //声明方法为异步请求方法
  _navigateToNextPage(BuildContext context) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage())
    );
    //请求返回后继续执行下面的显示 将子页面的返回用 snackbar的模式显示出来
    Scaffold.of(context).showSnackBar(SnackBar(content:Text('$result')));
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('子叶详情'),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('长腿mm'),
              onPressed: (){
                Navigator.pop(context,'青灯姬 3344556');//需要返回的数据 放到第二个参数里面
              },
            ),
            RaisedButton(
              child: Text('兔耳朵mm'),
              onPressed: (){
                Navigator.pop(context,'山兔mm 112233');
              },
            )
          ],
        ),
      ),
    );
  }
}
