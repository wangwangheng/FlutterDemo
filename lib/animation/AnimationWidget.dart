import 'package:flutter/material.dart';
import 'AnimationImage.dart';

class AnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationWidgetState();

}

class AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animation = Tween(begin: 100.0,end: 300.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("AnimatedWidget"),),body: Stack(children: <Widget>[

      AnimationImage(animation: _animation,),


      Container(alignment: Alignment.topCenter,
          padding: EdgeInsets.all(8),
          child: MaterialButton(child: Text("开始动画"),onPressed: (){
          if(!_controller.isAnimating){
            _controller.reset();
            _controller.forward();
          }
        },)),
    ],),);
  }

}