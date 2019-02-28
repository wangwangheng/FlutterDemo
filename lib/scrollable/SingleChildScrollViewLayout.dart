import 'package:flutter/material.dart';

class SingleChildScrollViewLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SingleChildScrollViewLayoutState();

}

class SingleChildScrollViewLayoutState extends State<SingleChildScrollViewLayout> {
  final String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("SingleChildScrollView"),),body: Scrollbar(child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      reverse: true,
      padding: EdgeInsets.all(16),
      child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: str.split("").map((e)=> Text(e,style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.w200),textScaleFactor: 3,)).toList(),)),
    )),);
  }

}