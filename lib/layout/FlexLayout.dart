import 'package:flutter/material.dart';

class FlexLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FlexLayoutState();

}

class FlexLayoutState extends State<FlexLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Flex Layout"),),
      body: Flex(direction: Axis.vertical,children: <Widget>[

        Expanded(flex: 10,
          child: Container(color: Colors.red,height: 20,),
        ),

        SizedBox(height: 1,),
        Expanded(flex: 20,
          child: Container(color: Colors.green,height: 20,),
        ),
        Expanded(flex: 30,
          child: Container(color: Colors.blue,height: 20,),
        ),




      ],
      ),);
  }

}