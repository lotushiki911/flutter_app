import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(765),
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          selectAllButton(),
          countArea(),
          goButton(),
        ],
      ),
    );
  }

  //全选按钮
  Widget selectAllButton(){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            activeColor: Colors.pink,
            onChanged: (bool val){},
          ),
          Text('全选'),
        ],
      ),
    );
  }

  //合计区域
  Widget countArea(){
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(270),
                child: Text('合计: ',style: TextStyle(fontSize: ScreenUtil().setSp(36)),),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(130),
                child: Text(
                  '￥:1999 ',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30),color: Colors.red),),
              ),
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(400),
            alignment: Alignment.centerRight,
            child: Text('满500免配送费: ',style: TextStyle(color:Colors.black38,fontSize: ScreenUtil().setSp(36)),),
          ),

        ],
      ),
    );
  }

  //结算模块
  Widget goButton(){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            //圆角弧度
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text('结算(6)',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
