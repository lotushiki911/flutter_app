import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/provide/home_info_provide.dart';
import 'package:flutter_app/com/tiand/refreshTools/refresh_footer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'homes_page/ad_bar_page.dart';
import 'homes_page/floor_widget_page.dart';
import 'homes_page/hot_goods_page.dart';
import 'homes_page/mid_navi_page.dart';
import 'homes_page/recommend_page.dart';
import 'homes_page/swiper_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// 主home页面
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title:Text('呵呵买买买')),
        body: FutureBuilder(
          //接收一个异步请求方法
          future: _getHomeInfo(context), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
          ///snapshot就是_calculation在时间轴上执行过程的状态快照
          builder: (context,snapshot){
            if (snapshot.hasData) {
              //使用上拉下载插件需要使用ListView
              return EasyRefresh(
                //自定义刷新footer
                refreshFooter: classFooter(),
                child: ListView(
                  children: <Widget>[
                    // 首页轮播
                    SwiperPage(),
                    // 类别导航图标
                    MidNavigatorPage(),
                    //可以继续往下加内容比如 广告位
                    AdBarPage(),
                    //外拨电话模块
//                  LeaderPhone(callpics[0]['url'].toString(), leaderNum),
                    //秒杀模块  横式3个小模块 每个模块纵式布局
                    RecommendPage(),
                    //楼层组合
                    FloorContentPage(),
                    //火爆专区
                    HotGoodsPage(),
                  ],
                ),
                //加载
                loadMore: () async{
                  print('获取火爆专区');
                  _getLoadmore(context);
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
      )
    );
  }
  //获取主页主体信息
  Future _getHomeInfo(BuildContext context) async {
    await Provider.of<HomeInfoProvide>(context,listen: false).getHomeInfoRequest();
    return '加载数据完成';
  }
  //获取主页火爆抢购信息
  Future _getLoadmore(BuildContext context) async {
    await Provider.of<HomeInfoProvide>(context,listen: false).getLoadHomeMore();
    return '加载数据完成';
  }

}