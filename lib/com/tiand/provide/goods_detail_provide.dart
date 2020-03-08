import 'package:flutter/material.dart';
import '../model/goods_detail_model.dart';
import '../service/service_method.dart';
import 'dart:convert';

//将业务逻辑放入到provide中 与UI界面分离

class GoodDetailProvide with ChangeNotifier{
  DetailsModel goodDetals = null;

  bool isLeft = true;
  bool isRight = false;

  //tabbar 切换方法
  changeLeftOrRight(String changeState){
    if(changeState == 'left'){
      isLeft = true;
      isRight = false;
    }else{
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

  //从后台获取商品数据
  getGoodsDetail(String detailId) async{
    var formData = {'goods_id': detailId};
    await requestForm('getGoodsDetailInfo',formData: formData).then((val){
      var responseData = json.decode(val.toString());
      print(responseData);
      goodDetals = DetailsModel.fromJson(responseData);
      print('商品名称是${goodDetals.detailData.detailInfo.goodsName}');
      //数据获取完了通知
      notifyListeners();
    });
  }
}

