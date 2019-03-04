import 'package:flutter/material.dart';

class LinearLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LinearLayoutState();

}

class LinearLayoutState extends State<LinearLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("线性布局"),),body: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[

        Row(textDirection: TextDirection.ltr,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("HelloWorld",style: TextStyle(color: Colors.greenAccent),),
              Text("HelloWorld",style: TextStyle(color: Colors.red,fontSize: 15),),
              Text("HelloWorld",style: TextStyle(color: Colors.deepOrange,fontSize: 25),),
            ],
        ),


      Expanded(child: Container(color: Colors.green,child:
        Column(mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end ,
          children: <Widget>[
          Text("HelloWorld",style: TextStyle(color: Colors.greenAccent),),
          Text("HelloWorld",style: TextStyle(color: Colors.red,fontSize: 15),),
          Text("HelloWorld",style: TextStyle(color: Colors.deepOrange,fontSize: 25),),
        ],)))



    ],),);
  }

}