import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_method.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../routers/routers_application.dart';


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

  int page = 0;
  List<Map> hotGoodList =[];
  GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    // TODO: implement initState
    print('初始化homepage页面并获取了数据!');
//    _getHotGoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = servicePath['homePageJumu'];
      return Scaffold(
        appBar: AppBar(title:Text('买买买')),
        body: FutureBuilder(
          ///snapshot就是_calculation在时间轴上执行过程的状态快照
          builder: (context,snapshot){
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
//              print('swiper=${swiper.toString()}');
//              print('navi=${navi.toString()}');
//              print('adpics=${adpics.toString()}');
//              print('callpics=${callpics.toString()}');
//              print('recommends=${recommends.toString()}');
              //下面防止溢出
//      return SingleChildScrollView(
//        //列式布局
//        child: Column(
              //使用上拉下载插件需要使用ListView
              return EasyRefresh(
//                refreshFooter: MaterialFooter(
//                  key: _footerkey,
//                  backgroundColor: Colors.white,
//                ),
                //自定义刷新footer
                refreshFooter: ClassicsFooter(
                  key: _footerkey,
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  //加载时候的颜色
                  moreInfoColor: Colors.pink,
                  //是否加载更多
                  showMore: true,
                  noMoreText: '',
                  moreInfo: '加载中',
                  loadedText: '呵呵呵',
                  loadingText: '加载完成',
                  //准备文字
                  loadReadyText: '准备加载...',
                  loadText: '加载...',
                ),
                child: ListView(
                  children: <Widget>[
                    // 首页轮播
                    SwiperDiy(swiperDataList: swiper,),
                    // 类别导航图标
                    MidNavigator(navigatorList: navi),
                    //可以继续往下加内容比如 广告位
                    AdBar(adPic:adpics[0]['url'].toString()),
                    //外拨电话模块
//                  LeaderPhone(callpics[0]['url'].toString(), leaderNum),
                    //秒杀模块  横式3个小模块 每个模块纵式布局
                    Recommend(recommendList:recommends),
                    //楼层组合
                    FloorContent(picAddress:floorTitle[0]['url'].toString(),floorContents:floorContent),
                    //火爆专区
                    _hotGoods(),
                  ],
                ),
                //加载
                loadMore: () async{
                  print('获取火爆专区');
                  var formData = {'pagin': page};
                  getHomePageImg(servicePath['homePageHuobao'],formData:formData)
                      .then((val) {
                    var data = json.decode(val.toString());
                    List<Map> newHotGoodList = (data['huobao_content'] as List)
                        .cast();
                    if (newHotGoodList.length > 0) {
                      setState(() {
                        hotGoodList.addAll(newHotGoodList);
                        page++;
                      });
                    }});
                },
                //刷新
                onRefresh: () async{
                  print('刷新111');
                },
              );
            } else {
              return  Text('没有数据了');
            }
          },
          //接收一个异步请求方法
          future: getHomePageImg(url), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
//        ),
      )
    );
  }

  // 组合火爆专区
  Widget _hotGoods(){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      ),
    );
  }

  //流式布局设置火爆专区 标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.center,
    padding: EdgeInsets.all(5.0),
    color: Colors.transparent,
    child: Text(
      '什么值得买',
      style: TextStyle(
        color: Colors.redAccent,
        fontSize: ScreenUtil().setSp(30),
      ),
    ),
  );

  //构建流式布局体
  Widget _wrapList(){
    if(hotGoodList.length != 0 ){
      //将List<Map> 转变为流式布局需要的List<Widget>
      List<Widget> widgetList = hotGoodList.map((val){
        return InkWell(
          onTap: (){
            //使用fluro路由跳转详情页
            print(val.toString());
            RoutersApplication.router.navigateTo(context, '/detail?id=${val['_id']['\$oid']}');
          },
          //每个container包含 一个图片 一个名称  一个价格
          child: Container(
            width: ScreenUtil().setWidth(375),
            color: Colors.white12,
            padding: EdgeInsets.all(3.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                //图片
                getNetWorkImage(val['static_url']),
                //名称
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(20)),
                ),
                //价格
                Row(
                  children: <Widget>[
                    Text(val['price'],style: TextStyle(color: Colors.red),),
                    Text(
                      '2000',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough
                    ),)
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      //返回一个流式布局组件
      return Wrap(
        //每行2个元素
        spacing: 2,
        //待传入的List<Widget>
        children: widgetList,
      );
    }else{
      return Text('没有更多了...');
    }
  }


}

/// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDataList ;
  SwiperDiy({Key key,this.swiperDataList}):super(key:key);

  @override
  Widget build(BuildContext context) {

//    print("获取设备像素密度值${ScreenUtil.pixelRatio}");
//    print("获取设备高度值${ScreenUtil.screenHeight}");
//    print("获取设备宽度值${ScreenUtil.screenWidth}");

    return Container(
      //宽高不设置会报错
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(600),
//      width: 200,
      child: Swiper(
        // 构造器
        itemBuilder: (BuildContext context,int index){
          // 获取静态资源
          return InkWell(
            onTap: (){
              RoutersApplication.router.navigateTo(context, '/detail?id=lunbo1');
            },
            child: getNetWorkImageWithWH("${swiperDataList[index]['url']}",768,300),
          );
//            return
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
  MidNavigator({Key key,this.navigatorList}):super(key:key);

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
          getNetWorkImageWithWH(item['url'],118,118),
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
        physics: NeverScrollableScrollPhysics(),
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
        child: getNetWorkImage(adPic),
      )
    );
  }

  //外拨 电话 短信 email http
  void _launcherUrl() async{
    String url = 'tel:' + '+8618900010001';
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

  LeaderPhone({Key key,this.leaderImage,this.serialNumber}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 768.0,
      height: 100.0,
      child: InkWell(
        onTap: _launcherUrl,
        child: getNetWorkImage(leaderImage),
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
  Recommend({Key key,this.recommendList}):super(key:key);

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
  Widget _item(context,index,){
    return InkWell(
      onTap: (){
        print('商品详情');
        RoutersApplication.router.navigateTo(context, '/detail?id=lunbo1');
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
            getNetWorkImage(recommendList[index]['url']),
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
          return _item(context,index);
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
  FloorTitle({Key key,this.pic_address}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: getNetWorkImage(pic_address),
    );
  }
}

/// 楼层组件 - 2 商品列表
class FloorContent extends StatelessWidget {
  final String picAddress;
  final List floorContents;
  FloorContent({Key key,this.picAddress, this.floorContents}):super(key:key);

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
          _firstRow(context),
          _secondRow(context),
        ],
      ),
    );
  }

  //定义单个模组
  Widget _goodsItem(context,Map goods,int width,int height){
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setHeight(height),
      child: InkWell(
        onTap: (){
//          print('楼层商品详情');
          RoutersApplication.router.navigateTo(context, '/detail?id=lunbo1');

        },
        child: getNetWorkImage(goods['url']),
      ),
    );
  }

  // 第一行楼层组建
  Widget _firstRow(context){
    return Row(
      children: <Widget>[
        //左边是一个大的
        _goodsItem(context,floorContents[0],384,384),
        //右边是两个小的 需要使用column
        Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  _goodsItem(context,floorContents[1],192,192),
                  _goodsItem(context,floorContents[2],192,192),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  _goodsItem(context,floorContents[3],192,192),
                  _goodsItem(context,floorContents[4],192,192),
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
  Widget _secondRow(context){
    return Row(
      children: <Widget>[
        //左边是一个大的
        _goodsItem(context,floorContents[5],384,200),
        //右边是两个小的 需要使用column
        _goodsItem(context,floorContents[6],384,200),
      ],
    );
  }

}

//class HotGoods extends StatefulWidget {
//  @override
//  _HotGoodsState createState() => _HotGoodsState();
//}
//
//class _HotGoodsState extends State<HotGoods> {
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    String url = servicePath['homePageHuobao'];
//    var formData = {'pagin': '1'};
//    getHomePageImg(url,formData:formData).then((val){
//      print(val);
//    });
//    super.initState();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Text('lalalalal'),
//    );
//  }
//}


