
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/com/tiand/model/home_info_model.dart';
import 'package:flutter_app/com/tiand/model/huobao_model.dart';
import 'package:flutter_app/com/tiand/service/service_method.dart';

class HomeInfoProvide extends ChangeNotifier{
  //主页获取的数据集
  //首页轮播
  List<HomeData> _swiperList = [];
  List<HomeData> get swiperList => _swiperList;
  //中部导航栏按钮
  List<HomeData> _naviList = [];
  List<HomeData> get naviList => _naviList;
  //广告位
  List<HomeData> _adList = [];
  List<HomeData> get adList => _adList;
  //电话广告
  List<HomeData> _callList = [];
  List<HomeData> get callList => _callList;
  //商品推荐
  List<HomeData> _recommendList = [];
  List<HomeData> get recommendList => _recommendList;
  //楼层图标
  List<HomeData> _floorTitleList = [];
  List<HomeData> get floorTitleList => _floorTitleList;
  //楼层楼体
  List<HomeData> _floorContentList = [];
  List<HomeData> get floorContentList => _floorContentList;

  //抢购专区page
  int _page = 0;
  int get page => _page;
  //抢购火爆列表
  List<HuoData> _huoList = [];
  List<HuoData> get huoList => _huoList;

  //获取home页面的主要数据
  getHomeInfoRequest()async{
    await requestForm('homePageJumu').then((val){
      var data = json.decode(val.toString());
      List<HomeData> list = HomeInfoModel.fromJson(data).homeData;
      list.forEach((ele){//遍历每个元素  此时不可add或remove  否则报错 但可以修改元素值，
        if(ele.staticType == '1'){
          _swiperList.add(ele);
        }else if(ele.staticType == '2'){
          _naviList.add(ele);
        }else if(ele.staticType == '3'){
          _adList.add(ele);
        }else if(ele.staticType == '4'){
          _callList.add(ele);
        }else if(ele.staticType == '5'){
          _recommendList.add(ele);
        }else if(ele.staticType == '6') {
          _floorTitleList.add(ele);
        }else if(ele.staticType == '7') {
          _floorContentList.add(ele);
        }
      });
      notifyListeners();
    });
  }

  //上拉获取抢购专区
  getLoadHomeMore() async {
    var formData = {'pagin': _page};
    await requestForm('homePageHuobao', formData: formData)
        .then((val) {
      var data = json.decode(val.toString());
      _huoList.addAll(HuoModel.fromJson(data).huoData);
      _page++;
      notifyListeners();
    });
  }
}