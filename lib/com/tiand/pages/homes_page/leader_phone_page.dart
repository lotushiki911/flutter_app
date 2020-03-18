import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/pages/pageRely/page_list.dart';
import 'package:url_launcher/url_launcher.dart';

/// 拨打电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String serialNumber;

  LeaderPhone({this.leaderImage,this.serialNumber});

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