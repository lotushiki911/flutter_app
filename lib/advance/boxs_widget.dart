import 'package:flutter/cupertino.dart';

//定义一个拖拽器  返回的是位置信息
class BoxsWidget extends StatefulWidget {
  final Offset offset; //小方块的位置
  final Color widgetColor; //小方块的颜色
  //重写构造方法 用于调用的时候传递参数
  const BoxsWidget({Key key,this.offset,this.widgetColor}):super(key:key);

  @override
  _BoxsWidgetState createState() => _BoxsWidgetState();
}

class _BoxsWidgetState extends State<BoxsWidget> {

  Offset offset = Offset(0.0,0.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offset = widget.offset;
  }

  //直接返回一个位置组件
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      //Draggable 可拖动组件
      child: Draggable(
        //待传递的数据
        data: widget.widgetColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor,
        ),
        //拖动的时候子元素的样式  放大一点并透明化
        feedback: Container(
          width: 120.0,
          height: 120.0,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        //松手的时候的样式
        onDraggableCanceled: (Velocity velocity,Offset offset){
          setState(() {
            //原始的位置 新的位置(拖动到那里)
            this.offset = offset;
          });
        },
      ),
    );
  }
}
