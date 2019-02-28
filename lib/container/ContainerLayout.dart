import 'package:flutter/material.dart';

class ContainerLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContainerLayoutState();

}

class ContainerLayoutState extends State<ContainerLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("容器类"),),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 50,
            ),
            child: Container(
              color: Colors.red,
              height: 20,
              child: Text("HelloWorld",
                style: TextStyle(color: Colors.white),) ,),
          ),

          Padding(padding: EdgeInsets.only(top: 16),),

          SizedBox(width: 80,height: 80,
            child: Container(color: Colors.green,
              child: Center(widthFactor: 1,heightFactor: 1,
                child: Text("Hello",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "Courier New"),),),)),

          Padding(padding: EdgeInsets.only(top:16),),

          DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Colors.red,Colors.orange]),
                boxShadow: [BoxShadow(color: Color(0x3F000000),offset: Offset(2.0,2.0),blurRadius: 4)],
            ),
            position: DecorationPosition.background,
            child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),child: Text("Hello",style: TextStyle(color: Colors.white,fontSize: 20),)),
          ),


          Padding(padding: EdgeInsets.only(top:30),),

          Container(color: Colors.black,
            child: Transform(transform: Matrix4.skewY(0.3),alignment: Alignment.topRight,
              child: Container(padding: EdgeInsets.all(8),color: Colors.red,child: Text("Hello World"),),
            ),
          ),


          Padding(padding: EdgeInsets.only(top:30),),

          Container(color: Colors.black,
            child: Transform.translate(offset: Offset(20, -20),
              child: Container(padding: EdgeInsets.all(8),color: Colors.red,child: Text("Hello World"),),
            ),
          ),


          Padding(padding: EdgeInsets.only(top:30),),

          Container(color: Colors.black,
            child: Transform.scale(scale: 1.2,origin: Offset(20, 0),alignment: Alignment.topRight,
              child: Container(padding: EdgeInsets.all(8),color: Colors.red,child: Text("Hello World"),),
            ),
          ),

          Padding(padding: EdgeInsets.only(top:30),),

          Container(color: Colors.black,
            child: Transform.rotate(angle: 0.3,
              child: Container(padding: EdgeInsets.all(8),color: Colors.red,child: Text("Hello World"),),
            ),
          ),


          Padding(padding: EdgeInsets.only(top:30),),

          RotatedBox(quarterTurns: 1,child: Text("Hello",style: TextStyle(color: Colors.red),))

    ],),);
  }

}