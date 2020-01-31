import 'package:flutter/material.dart';

class warpBaseDemo extends StatefulWidget {
  @override
  _warpBaseDemoState createState() => _warpBaseDemoState();
}

class _warpBaseDemoState extends State<warpBaseDemo> {
  List<Widget> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = List<Widget>()..add(warpButtonAdd());
  }

  Widget warpButtonAdd() {
    //手势识别 组件
    //Contain 本来是没有手势识别的
    // 但是如果在外层加一个 gesture组件就能将contain包裹进行手势识别
    return GestureDetector(
      //点击手势操作
      onTap: (){
        //因为是stateful组件 只有在改变状态的时候添加数组元素才会有效
        setState(() {
          //如果添加的数组的长度小于9则可以继续添加
          if( list.length < 9){
            list.insert(list.length-1, buildPhoto());
          }
        });
      },
      //最上层的那个添加按钮属性  padding 类似container
      child: Padding(
        padding: const EdgeInsets.all(8.0),//设置容器的内边距
        child: Container(
          width: 40.0,
          height: 40.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  //写一个方法点击计数器增加计数
  void removePhonto() {

  }

  var stack = new Stack(
    //在组件里的对齐方式 本例中 指的是 对齐图片的重叠方式 ，文字回出现在背景图片的中间下方
    alignment: const FractionalOffset(0.5, 0.8),
    children: <Widget>[
      MaterialButton(
        child: Icon(Icons.cancel),
//        onPressed: (){
//          setState(() {
//            list.remove(list.length-1);
//          });
//        }
      ),
      Container(
        width: 40.0,
        height: 40.0,
        color: Colors.yellow,
        child: Center(
          child: Text('照片'),
        ),
      ),
    ],
  );

  //如果是正式场景 应该放入的是图片的略缩图.这里简单的由一张容器来代替
  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 40.0,
        height: 40.0,
        color: Colors.yellow,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //获取当前屏幕的长宽分辨率
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      //居中 + 透明度 + 容器
      //如果想要给容器上添加样式,向上嵌套
      body: Center(
        //设置透明度
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            //流式布局组件wrap
            child: Wrap(
              children: list, //子组件就直接用添加的list
              spacing: 26.0,//间距

            ),
          ),
        ),
      ),
    );
  }
}
