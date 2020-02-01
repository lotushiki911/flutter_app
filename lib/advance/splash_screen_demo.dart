import 'package:flutter/material.dart';

//闪屏 动画  主页载入动画效果
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//动画需要混入 所有进行多继承
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  //动画控制器   控制动画时间
  AnimationController _controller;
  //被控制的动画
  Animation _animation;


  @override
  void initState() {
    super.initState();
    //初始化控制器 两个参数 第一个参数垂直动态演示 第二个参数动画持续时间(毫秒)
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    //初始化动画并绑定动画控制器
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);
    //添加动画状态监听 如果当前动画结束,则跳转到主页
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        //pushAndRemoveUntil会先结束掉动画然后进行跳转
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
            (route) => route == null
        );
      }
    });
    //播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  //添加动画效果
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      //添加动画效果(动画初始化的时候已经绑定了动画控制器)
      opacity: _animation,
      //添加动画图片
      child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580559533391&di=657a7ed605d7e79c944f9bd4721d613c&imgtype=0&src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2Fday_111113%2F1111131811fe8b6d1575c620d7.jpg'
        ,scale: 2.0,//缩放
        fit: BoxFit.cover, //填充方式 填满
      ),

    );
  }
}

//主页
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('呵呵哒'),
      ),
    );
  }
}


