import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provide/provide.dart';
import '../provide/goods_detail_provide.dart';
import 'details_page/detail_price.dart';
import 'details_page/details_bootom.dart';
import 'details_page/details_explain.dart';
import 'details_page/details_tabbar.dart';
import 'details_page/details_top.dart';
import 'details_page/details_web.dart';

class DetailsPage extends StatelessWidget {
  String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    //获取数据 从provide中
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
        //返回图标按钮
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            //直接返回上一级
            Navigator.pop(context);
          },
        ),
      ),
      //等待异步完成
      body: FutureBuilder(
        //加载一个延迟组件
        future: _getDetailinfo(context),
        //自动保持的数据
        builder: (context,snapshot){
          //如果获取到了数据
          if (snapshot.hasData) {
            //层叠组件 保持购物车一致在最下方
            return Stack(
              children: <Widget>[
                Container(
                  child: ListView(
                    children: <Widget>[
                      DetailsTopArea(),
                      DetailPriceArea(),
                      DetailsExplainArea(),
                      DetailsTabBar(),
                      DetailsWabArea(),
                    ],
                  ),
                ),
                //使用positioned定位
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailsBottom(),
                )
              ],
            );
          } else {
            return Text('加载中');
          }
        },
      ),
    );
  }

  //返回一个future 给FutureBuilder使用
  Future _getDetailinfo(BuildContext context) async{

    if(goodsId == 'ed675dda49e0445fa769f3d8020ab5e8') {
      goodsId = 'ed675dda49e0445fa769f3d8020ab5e8';
    }else if(goodsId == 'ed675dda49e0445fa769f3d8020ab5e7'){
      goodsId = 'ed675dda49e0445fa769f3d8020ab5e7';
    }else{
      goodsId = 'ed675dda49e0445fa769f3d8020ab5e9';
    }

//    await Provide.value<GoodDetailProvide>(context).getGoodsDetail(goodsId);
    await Provider.of<GoodDetailProvide>(context,listen: false).getGoodsDetail(goodsId);
    print('加载商品详情provide完毕');
    return '完成加载';
  }

}
