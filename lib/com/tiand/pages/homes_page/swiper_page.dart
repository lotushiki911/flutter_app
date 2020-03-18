import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:flutter_app/com/tiand/provide/home_info_provide.dart';
import 'package:flutter_app/com/tiand/routers/routers_application.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

/// 首页轮播组件
class SwiperPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeInfoProvide>(
      builder: (context,val,_){
        return Container(
          //宽高不设置会报错
          height: ScreenUtil().setHeight(300),
          width: ScreenUtil().setWidth(600),
          child: Swiper(
            // 构造器
            itemBuilder: (BuildContext context,int index){
              // 获取静态资源
              return InkWell(
                onTap: (){
                  RoutersApplication.router.navigateTo(context, '/detail?id=ed675dda49e0445fa769f3d8020ab5e7');
                },
                child: getNetWorkImageWithWH("${val.swiperList[index].staticUrl}",768,300),
              );
            },
            //数量
            itemCount: 3,
            // 导航分页器
            pagination: SwiperPagination(),
            //自动导航
            autoplay: true,
          ),
        );
      },
    );
  }
}