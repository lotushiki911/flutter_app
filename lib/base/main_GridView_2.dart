import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'ListView ...',
      home: Scaffold(
        appBar: AppBar(title: Text('Listview haha...')),
        //网格列表 多用在图片现实
        body: new GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行显示数量
            mainAxisSpacing: 2.0, //网格行间距
            crossAxisSpacing: 2.0, //网格列间距
            childAspectRatio: 1.0, //网格 横竖比例  宽高比  一般海报 为0.7
          ),
          children: <Widget>[
            new Image.network('https://pics6.baidu.com/feed/962bd40735fae6cd4fb6a0ab6c9e012243a70fa8.jpeg?token=80fef56e47562245eb329a369a11b3f7&s=96B7D1A6166484EC0AA733BA0300D01C',fit: BoxFit.cover,),
            new Image.network('https://pics2.baidu.com/feed/7dd98d1001e93901d0cba26a18c15ae137d19648.jpeg?token=822f7a9ed1008256e874db028bf34e01&s=9FB6D8A662E08AE60CE969BE03009008',fit: BoxFit.cover),
            new Image.network('https://pics3.baidu.com/feed/9f2f070828381f304a41bcc1cc2c420e6e06f035.jpeg?token=ccf5676770f5b676c5413b868d189641&s=97E0C1A74A758DE5461828A60300D007',fit: BoxFit.cover),
            new Image.network('https://pics6.baidu.com/feed/ae51f3deb48f8c54b12b2fd3bb8b23f3e2fe7ffe.jpeg?token=b06fdde94e6835b4eec95ca752761502&s=F7824FAE4E8278D244AE05FA0300D02A',fit: BoxFit.cover),
            new Image.network('https://pics1.baidu.com/feed/203fb80e7bec54e7627fb3c33b9a95564dc26a80.jpeg?token=96bab33fa948e353b4f95370a3401600&s=D7958D644424490D798C69D20300C0BA',fit: BoxFit.cover),
            new Image.network('https://pics2.baidu.com/feed/e7cd7b899e510fb31ddf438f1d1dc793d0430c93.jpeg?token=245c8561617f43bee2b55767e273e14a',fit: BoxFit.cover),
            new Image.network('https://pics3.baidu.com/feed/91ef76c6a7efce1b97890e982bfaffd8b58f6577.jpeg?token=456ac01295deb6544e656511795e3c62&s=8803EB160C72C686B29CF94C030060B9',fit: BoxFit.cover),
            new Image.network('https://pics2.baidu.com/feed/7e3e6709c93d70cf92fa60d7f12bdf06b8a12be1.jpeg?token=b67ca49944f39a7e41d667a00100774d&s=3493789442B09FCE1AA2DF890300709D',fit: BoxFit.cover),
            new Image.network('https://pics0.baidu.com/feed/3812b31bb051f81934ab8c224b4a44eb2c73e7d5.jpeg?token=dcd59a716ddf65f09e6a1af4fc7834a8&s=B293E16C4BF0B8D842EF8018030040DB',fit: BoxFit.cover),
            new Image.network('https://pics5.baidu.com/feed/03087bf40ad162d97a41499a61f9a6ea8b13cdb1.jpeg?token=480a6cfabe3af182dabd7e7b4d1bc63f&s=BE91C8030A713786F6B03D870100E0B1',fit: BoxFit.cover),
          ],
        )
      ),
    );
  }
}