import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//数量控制UI
class CartCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.black38)
      ),
      child: Row(
        children: <Widget>[
          _leftBottom(),
          _centerBottom(),
          _rightBottom(),
        ],
      ),
    );
  }

  Widget _centerBottom(){
    return Container(
      width: ScreenUtil().setWidth(60),
//      height: ScreenUtil().setHeight(35),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('1'),
    );
  }

  Widget _leftBottom(){
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(45),
//        height: ScreenUtil().setHeight(35),
//        color: Colors.white,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
              width: 1,
              color: Colors.black12
            )
          )
        ),
        child: Text('-'),
      ),
    );
  }

  Widget _rightBottom(){
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(45),
//        height: ScreenUtil().setHeight(35),
//        color: Colors.white,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(
                    width: 1,
                    color: Colors.black12
                )
            )
        ),
        child: Text('+'),
      ),
    );
  }
}
