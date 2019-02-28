import 'package:flutter/material.dart';

class FlowLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FlowLayoutState();

}

class FlowLayoutState extends State<FlowLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("流式布局"),),body:Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[

      Wrap(spacing: 10,runSpacing: 20,alignment: WrapAlignment.center,crossAxisAlignment: WrapCrossAlignment.start,children: <Widget>[

        Chip(avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("A"),),label: Text("American"),),
        Chip(avatar: CircleAvatar(backgroundColor: Colors.red,child: Text("B"),),label: Text("BenchMarker"),),
        Chip(avatar: CircleAvatar(backgroundColor: Colors.deepOrange,child: Text("C"),),label: Text("Chinese"),),
        Chip(avatar: CircleAvatar(backgroundColor: Colors.cyan,child: Text("D"),),label: Text("Doctor"),)

      ],),

      Flow(delegate: TestFlowDelegate(margin: EdgeInsets.all(16)),children: <Widget>[
        Container(width: 60,height: 60,color: Colors.cyan,),
        Container(width: 60,height: 60,color: Colors.red,),
        Container(width: 60,height: 60,color: Colors.blue,),
        Container(width: 60,height: 60,color: Colors.yellow,),
        Container(width: 60,height: 60,color: Colors.orange,),
        Container(width: 60,height: 60,color: Colors.green,),
        Container(width: 60,height: 60,color: Colors.purple,),
        Container(width: 60,height: 60,color: Colors.pink,),
      ],),


    ],));
  }

}

class TestFlowDelegate extends FlowDelegate {
  TestFlowDelegate({this.margin});

  EdgeInsets margin = EdgeInsets.zero;


  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,400);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}