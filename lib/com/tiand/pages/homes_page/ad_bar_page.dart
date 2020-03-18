import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:flutter_app/com/tiand/provide/home_info_provide.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// 广告展示
class AdBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var adList = Provider.of<HomeInfoProvide>(context).adList;
    return InkWell(
      //单击事件
        onTap: _launcherUrl,
        child: Container(
          width: 768.0,
          child: getNetWorkImage(adList[0].staticUrl),
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