import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HeroAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HeroAnimationState();
  }

}

class HeroAnimationState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Hero动画"),),body: Column(
      children: <Widget>[
        Container(alignment: Alignment.topCenter,child:
              InkWell(child: Hero(tag: "avatar",
                  child: ClipOval(child: Image.asset("graphics/ic_launcher.png",width: 50,),)),),),


        RaisedButton(child: Text("Hero跳转"),onPressed: (){
          Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
            return FadeTransition(opacity: animation,child: CupertinoPageScaffold(child: HeroTargetWidget()),);
          }));
        },),


      ],
    ),);
  }
}

class HeroTargetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Hero Target"),),body: Center(
      child: Hero(tag: "avatar", child: Image.asset("graphics/ic_launcher.png",width: 300,fit: BoxFit.fill,),),));
  }
  
}