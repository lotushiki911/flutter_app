import 'package:flutter/material.dart';
import 'dart:math';
//慢进快出 动画
class CustomRoute extends PageRouteBuilder{
  final Widget widget;
  final int randint ;

  CustomRoute(this.widget,this.randint)
    :super(
      transitionDuration:Duration(seconds: 1),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
      ){
        return widget;
      },
      transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child
      ){
        switch(randint){
          case 0:
          //渐隐渐显效果
            return FadeTransition(
              opacity: Tween(begin: 0.0,end: 1.0)
                  .animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn
              )),
              child: child,
            );
            break;
          case 1:
          //缩放效果
            return ScaleTransition(
              scale: Tween(begin: 0.0,end: 1.0)
                  .animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn
              )),
              child: child,
            );
            break;
          case 2:
          //旋转+缩放
            return RotationTransition(
              turns: Tween(begin: 0.0,end: 1.0)
                  .animate(CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn
              )),
              child: ScaleTransition(
                scale: Tween(begin: 0.0,end: 1.0)
                    .animate(CurvedAnimation(
                      curve: Curves.fastOutSlowIn,
                      parent: animation1
                )),
                child: child,
              ),
            );
            break;
          case 3:
          //左右滑动动画
            return SlideTransition(
              //屏幕的归一化,即屏幕左上角为(0,0),右下角为(1,1)
              position: Tween<Offset>(
                begin: Offset(-1.0,0.0),
                end: Offset(0.0,0.0)
              )
              .animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn
              )),
              child: child,
            );
            break;
          default :
          //渐隐渐显效果
            return FadeTransition(
              opacity: Tween(begin: 0.0,end: 1.0)
                  .animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn
              )),
              child: child,
            );
            break;
        };
      }
  );
}