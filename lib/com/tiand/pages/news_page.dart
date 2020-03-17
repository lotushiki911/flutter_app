import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
//import 'package:provide/provide.dart';
import '../service/service_method.dart';
import '../provide/counter.dart';
//import 'package:amap_base/amap_base.dart';
//import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  //首先申明两个变量
  String debugLable = 'Unknown';
  //极光推送
  final JPush jPush = JPush();

  //初始化极光平台
  Future<void> initJpushPlatState()async{
    //错误信息提示
    String platformVersion ;
    try{
      //监听响应事件
      jPush.addEventHandler(
        onReceiveNotification: (Map<String,dynamic> message){
          //接收到了做出响应
          print('>>>>>>>>>>>flutter接收到了推送:${message}');
          setState(() {
            debugLable = '接收到了推送:${message}';
          });
        }
      ) ;
    }on PlatformException{
      platformVersion = '平台版本获取失败,请检查!';
    }
    //没有错误直接返回
    if(!mounted) return ;
    //有错误则进行设置
    setState(() {
      debugLable = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('极光推送'),),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('推送结果是:${debugLable}'),
            FlatButton(
              child: Text('发送推送信息'),
              onPressed: (){
                //3秒钟
                var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch+3000);

                //配置一个推送信息
                var localNotification = LocalNotification(
                    id: 1234,
                    title: '一个极光推送来了',
                    buildId: 1,
                    content: '看到了吗',
                    fireTime: fireDate,
                    subtitle: '一个测试',
                );

                //本地信息推送
                jPush.sendLocalNotification(localNotification).then((res){
                  setState(() {
                    debugLable = res;
                  });
                });

              },
            )
          ],
        ),
      )
    );
  }

}

//class _NewsPageState extends State<NewsPage> {
//
//  MyLocationOption _myLocationOption = MyLocationOption();
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(title: Text('高德地图'),),
//      body: AmapView(
//        // 地图控制器
////        onAMapViewCreated: (controller){
////          _controller = controller;
////        },
//        // 地图类型 (可选)
//        mapType: MapType.Standard,
//        // 是否显示缩放控件 (可选)
//        showZoomControl: true,
//        // 是否显示指南针控件 (可选)
//        showCompass: true,
//        // 是否显示比例尺控件 (可选)
//        showScaleControl: true,
//        // 是否使能缩放手势 (可选)
//        zoomGesturesEnabled: true,
//        // 是否使能滚动手势 (可选)
//        scrollGesturesEnabled: true,
//        // 是否使能旋转手势 (可选)
//        rotateGestureEnabled: true,
//        // 是否使能倾斜手势 (可选)
//        tiltGestureEnabled: true,
//        // 缩放级别 (可选)
//        zoomLevel: 10,
//        // 中心点坐标 (可选)
//        centerCoordinate: LatLng(39, 116),
//        // 标记 (可选)
//        markers: <MarkerOption>[],
//        // 标识点击回调 (可选)
////        onMarkerClick: (Marker marker) {},
//        // 地图点击回调 (可选)
////        onMapClick: (LatLng coord) {},
//        // 地图拖动回调 (可选)
////        onMapDrag: (MapDrag drag) {},
//        // 地图创建完成回调 (可选)
//        onMapCreated: (controller) async {
//          // requestPermission是权限请求方法, 需要你自己实现
//          // 如果不知道怎么处理, 可以参考example工程的实现, example过程依赖了`permission_handler`插件.
//          if (await requestPermission()) {
//            await controller.showMyLocation(_myLocationOption);
//          }
//        },
//      ),
//    );
//  }
//
//  Future<bool> requestPermission() async {
//
//    final permissions =
//    await PermissionHandler().requestPermissions([PermissionGroup.location]);
//
//    if (permissions[PermissionGroup.location] == PermissionStatus.granted) {
//      return true;
//    } else {
//      toast('需要定位权限!');
//      return false;
//    }
//  }
//
//}
//class _NewsPageState extends State<NewsPage> {
//
//  TextEditingController textController = TextEditingController();
//  String showText = '快讯搜索';
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Scaffold(
//        appBar: AppBar(title: Text('新闻快讯'),),
//        //不要跟listview一起用
//        //可以解决 像素超长 超出屏幕界限的问题
////        body: SingleChildScrollView(
////          child: Text(homePageContent),
////        ),
//        body: SingleChildScrollView(
//          child:  Container(
//          //列式布局
//          child: Column(
//            children: <Widget>[
//              TextField(
//                controller: textController,
//                //聚焦
//                autofocus: false,
//                //修饰器
//                decoration: InputDecoration(
//                  //边距
//                  contentPadding: EdgeInsets.all(10.0),
//                  labelText: '查询',
//                  helperText: '请输入查询',
//                ),
//              ),
//              RaisedButton(
//                onPressed: _choiceAction,
//                child: Text('查询'),
//              ),
//
//              Text(
//                showText,
//                //显示省略号
////                overflow: TextOverflow.ellipsis,
////                maxLines: 1,
//              ),
//              Number(),
//              ClickBottom(),
//            ],
//          ),
//        ),)
//      ),
//    );
//  }
//
//  //定义点击事件
//  void _choiceAction(){
//    print('开始选择----->');
//    if(textController.text.toString() == ''){
//      //如果为空的话显示提示
//      showDialog(
//          context: context,
//          builder: (context) => AlertDialog(title: Text('输入内容不能为空'),)
//      );
//    }else{
//      var data = {'name': textController.text.toString()};
//      getHomePageContent('homePageInfoByName',data).then((val){
//        setState(() {
//          print('狮子返回的数据为${val}');
//          if (val == ''){
//            showText = '没有查询到数据';
//          }else{
//            Map<String, dynamic> news = json.decode(val);
//            showText = news['item_info'];
//          }
//        });
//
//      });
//    }
//  }
//}

//class Number extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: Provide<Counter>(
//          builder: (context,child,counter){
//            return Text(
//                '${counter.value}'
//            );
//          },
//        )
//    );
//  }
//}
//
//
//class ClickBottom extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: RaisedButton(
//        onPressed: (){
//          Provide.value<Counter>(context).increment();
//        },
//        child: Text('点击增加'),
//      ),
//    );
//  }
//}

