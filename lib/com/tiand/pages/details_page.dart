import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/goods_detail_provide.dart';
import 'details_page/detail_price.dart';
import 'details_page/details_top.dart';

class DetailsPage extends StatelessWidget {
  String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    _getDetailinfo(context);
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
          if(snapshot.hasData){
            return Container(
              child: Column(
                children: <Widget>[
                  DetailsTopArea(),
                  DetailPrice(),
                ],
              ),
            );
          }else{
            return Text('加载中');
          }
        },
      ),
    );
  }

  //返回一个future 给FutureBuilder使用
  Future _getDetailinfo(BuildContext context) async{
    goodsId = 'ed675dda49e0445fa769f3d8020ab5e9';
    await Provide.value<GoodDetailProvide>(context).getGoodsDetail(goodsId);
    print('加载商品详情provide完毕');
    return '完成加载';
  }

}
