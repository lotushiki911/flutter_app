import 'package:flutter/material.dart';
import '../model/goods_detail_model.dart';
import '../service/service_method.dart';
import 'dart:convert';

//将业务逻辑放入到provide中 与UI界面分离

class GoodDetailProvide with ChangeNotifier{
  DetailsModel detailsModel = null;

  //从后台获取商品数据
  getGoodsDetail(String detailId){
    var formData = {'goods_id': detailId};
    requestForm('getGoodsDetailInfo',formData: formData).then((val){
      var responseData = json.decode(val.toString());
      print(responseData);
      detailsModel = DetailsModel.fromJson(responseData);
      print('商品名称是${detailsModel.detailData.detailInfo.goodsName}');
      //数据获取完了通知
      notifyListeners();
    });
  }
}

