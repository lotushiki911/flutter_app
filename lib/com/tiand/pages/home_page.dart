import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_method.dart';
import 'package:url_launcher/url_launcher.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// 主home页面
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  TextEditingController textController = TextEditingController();
  String showText = '欢迎你';

  @override
  void initState() {
    // TODO: implement initState
    print('初始化homepage页面并获取了数据!');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = servicePath['homePageJumu'];
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text(showText),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              showText = showText + '.';
            });
          },
          child: Icon(Icons.title),
        ),
        body: FutureBuilder(

          ///snapshot就是_calculation在时间轴上执行过程的状态快照
          builder: _buildFuture,
          //接收一个异步请求方法
          future: getHomePageImg(url), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
        ),
      )
    );
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    ///异步请求未执行完 显示等待 执行完了 返回执行结果中的数据 不需要使用set_state
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return null;
    }
  }

  //远程访问 异步请求 再渲染 不用使用动态改变set_state
  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      var data = json.decode(snapshot.data.toString());
      //将map 解析成list
      List<Map> list = (data as List).cast();
      List<Map> swiper = [];
      List<Map> navi = [];
      List<Map> adpics =[];
      List<Map> callpics =[];
      List<Map> recommends = [];
      List<Map> floorTitle = [];
      List<Map> floorContent = [];
      list.forEach((element){//遍历每个元素  此时不可add或remove  否则报错 但可以修改元素值，
        Map ele = {"name":element['static_name'].toString(),"url":element['static_url'].toString()};
        if(element['static_type'] == '1'){
          swiper.add(ele);
        }else if(element['static_type'] == '2'){
          if(navi.length == 8) {

          }else {
            navi.add(ele);
          }
        }else if(element['static_type'] == '3'){
          adpics.add(ele);
        }else if(element['static_type'] == '4'){
          callpics.add(ele);
        }else if(element['static_type'] == '5'){
          ele['new_price'] = element['new_price'];
          ele['old_price'] = element['old_price'];
          recommends.add(ele);
        }else if(element['static_type'] == '6') {
          floorTitle.add(ele);
        }else if(element['static_type'] == '7') {
          floorContent.add(ele);
        }
      });
      print('swiper=${swiper.toString()}');
      print('navi=${navi.toString()}');
      print('adpics=${adpics.toString()}');
      print('callpics=${callpics.toString()}');
      print('recommends=${recommends.toString()}');
      //下面防止溢出
      return SingleChildScrollView(
        //列式布局
        child: Column(
          children: <Widget>[
            // 首页轮播
            SwiperDiy(swiperDataList: swiper,),
            // 类别导航图标
            MidNavigator(navigatorList: navi),
            //可以继续往下加内容比如 广告位
            AdBar(adPic:adpics[0]['url'].toString()),
            //外拨电话模块
//            LeaderPhone(callpics[0]['url'].toString(), leaderNum),
            //秒杀模块  横式3个小模块 每个模块纵式布局
            Recommend(recommends),
            //楼层组合
            FloorContent(floorTitle[0]['url'].toString(),floorContent),
            //火爆专区
            HotGoods(),
          ],
        )
      );
    } else {
      return Center(
        //加载图标
        child: CircularProgressIndicator(),
      );
    }
  }


}

/// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDataList ;
  SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {

    print("获取设备像素密度值${ScreenUtil.pixelRatio}");
    print("获取设备高度值${ScreenUtil.screenHeight}");
    print("获取设备宽度值${ScreenUtil.screenWidth}");

    return Container(
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(768),
//      width: 200,
      child: Swiper(
        // 构造器
        itemBuilder: (BuildContext context,int index){
          // 获取静态资源
            return Image.network("${swiperDataList[index]['url']}",fit: BoxFit.fill,);
        },
        //数量
        itemCount: 3,
        // 导航分页器
        pagination: SwiperPagination(),
        //自动导航
        autoplay: true,
      ),
    );
  }
}

/// 中部类别导航组件
class MidNavigator extends StatelessWidget {
  final List navigatorList ;
  MidNavigator({this.navigatorList});

  ///构建一个小组件
  Widget _gridViewItemUI(BuildContext context,item){
    /// 小组件
    return InkWell(
      //单击事件
      onTap: (){
        print('点击');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['url'],
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(150),
            ),
          Text(item['name'])
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      //内距
      padding: EdgeInsets.all(2.5),
      //设置网格列表狮子
      child: GridView.count(
        //每行4各
        crossAxisCount: 4,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList()
      ),
    );
  }
}

/// 广告展示
class AdBar extends StatelessWidget {
  final String adPic ;
  AdBar({Key key,this.adPic}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //单击事件
        onTap: _launcherUrl,
      child: Container(
        width: 768.0,
        child: Image.network(adPic),
      )
    );
  }

  //外拨 电话 短信 email http
  void _launcherUrl() async{
    String url = 'tel:' + '+8617702779595';
//    String url = 'http://www.baidu.com';

    //异步 判断是否可用
    if(await canLaunch(url)){
      await launch(url);
    }else{
      //不能发送
      throw '无法调用url_launcher!';
    }
  }
}

/// 拨打电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String serialNumber;

  LeaderPhone(this.leaderImage,this.serialNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 768.0,
      height: 100.0,
      child: InkWell(
        onTap: _launcherUrl,
        child: Image.network(leaderImage),
      ),
    );
  }
  //外拨 电话 短信 email http
  void _launcherUrl() async{
    String url = 'tel:' + '+8618507140566';
    //异步 判断是否可用
    if(await canLaunch(url)){
      await launch(url);
    }else{
      //不能发送
      throw '无法调用url_launcher!';
    }
  }
}

/// 商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;
  Recommend(this.recommendList);

  //标题方法
  Widget _titleWidget(){
    return Container(
      //对齐
      alignment: Alignment.centerLeft,
      //四边设置对齐模式
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      //
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5,color: Colors.black12)
        )
      ),
      child: Text(
        '秒杀',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //商品单独项方法  跳转到详情页
  Widget _item(index){
    return InkWell(
      onTap: (){
        print('商品详情');
      },
      child: Container(
        height: ScreenUtil().setHeight(300),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(5.0),
        //箱式装饰器
        decoration: BoxDecoration(
          color: Colors.white,
          //边界定义
          border:Border(
            left: BorderSide(width: 1, color: Colors.black12),

          )
        ),
        child: Column(
          //每个小项 由三个内容组成: 图标,商品价格,源价格
          children: <Widget>[
            Image.network(recommendList[index]['url']),
            Text(
                '￥${recommendList[index]['new_price']}',
              style: TextStyle(
                color: Colors.redAccent
              ),
            ),
            Text(
                '￥${recommendList[index]['old_price']}',
              style: TextStyle(
                //删除线
                decoration: TextDecoration.lineThrough,
                color: Colors.grey
              ),
            )

          ],

        ),
      ),
    );
  }

  //横向列表 用来排列每行的 小部件
  Widget _recommedList(){
    return Container(
      height: ScreenUtil().setHeight(340),
      //设置横向 布局
      child: ListView.builder(
        //横轴模式
        scrollDirection: Axis.horizontal,
        //数量
        itemCount: recommendList.length,
        itemBuilder: (context,index){
          return _item(index);
        },
      ),
      //外边距
//      margin: EdgeInsets.only(top: 10.0),

    );
  }

  // 主方法
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(450),
      //外边距
      margin: EdgeInsets.only(top: 5.0),
      //组合 标题 和 横向列表
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList(),
        ],
      ),
    );
  }
}


/// 楼层组件 -
class FloorTitle extends StatelessWidget {
  final String pic_address;
  FloorTitle(this.pic_address);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(pic_address),
    );
  }
}

/// 楼层组件 - 2 商品列表
class FloorContent extends StatelessWidget {
  final String picAddress;
  final List floorContents;
  FloorContent(this.picAddress, this.floorContents);

  @override
  Widget build(BuildContext context) {
    return Container(
      //将每层楼层组合起来
      child: Column(
        children: <Widget>[
          // 1 标题
          Container(

            padding: EdgeInsets.all(8.0),
            child: getNetWorkImage(picAddress),
          ),
          //2 商品列表
          _firstRow(),
          _secondRow(),
        ],
      ),
    );
  }

  //定义单个模组
  Widget _goodsItem(Map goods,int width,int height){
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setHeight(height),
      child: InkWell(
        onTap: (){
          print('楼层商品详情');
        },
        child: getNetWorkImage(goods['url']),
      ),
    );
  }

  // 第一行楼层组建
  Widget _firstRow(){
    return Row(
      children: <Widget>[
        //左边是一个大的
        _goodsItem(floorContents[0],384,384),
        //右边是两个小的 需要使用column
        Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  _goodsItem(floorContents[1],192,192),
                  _goodsItem(floorContents[2],192,192),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  _goodsItem(floorContents[3],192,192),
                  _goodsItem(floorContents[4],192,192),
                ],
              ),
//
            ),
          ],
        )
      ],
    );
  }

  //第二行楼层组件
  Widget _secondRow(){
    return Row(
      children: <Widget>[
        //左边是一个大的
        _goodsItem(floorContents[5],384,200),
        //右边是两个小的 需要使用column
        _goodsItem(floorContents[6],384,200),
      ],
    );
  }

}

class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {

  @override
  void initState() {
    // TODO: implement initState
    String url = servicePath['homePageHuobao'];
    var formData = {'pagin': '1'};
    getHomePageImg(url,formData:formData).then((val){
      print(val);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('lalalalal'),
    );
  }
}


