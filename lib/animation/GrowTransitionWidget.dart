import 'package:flutter/material.dart';


class GrowTransitionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GrowTransitionState();
  }
}

class GrowTransitionState extends State<GrowTransitionWidget> with SingleTickerProviderStateMixin{


  AnimationController _controller;
  Animation<double> _animation;
  int _count = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animation = Tween(begin: 100.0,end: 300.0).animate(_controller);
    _animation.addStatusListener((AnimationStatus status){
      debugPrint("_count is :$_count");
      /**
       * dismissed 动画在起始点停止
          forward 动画正在正向执行
          reverse 动画正在反向执行
          completed 动画在终点停止
       */
      if(status == AnimationStatus.completed){
        _count++;

        if(_count <= 5) {
          _controller.reverse();
        }
      }else if(status == AnimationStatus.dismissed){
        _count++;

        if(_count <= 5) {
          _controller.forward();
        }
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("AnimatedBuilder")),body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GrowTransition(
          animation: _animation,
          child: Image.network("http://5b0988e595225.cdn.sohucs.com/images/20171003/51f95259cfdc4ea7afe94f46e5d5c219.gif"),),

        RaisedButton(child: Text("开始动画"),onPressed: (){
          if(!_controller.isAnimating){
            _controller.reset();
            _controller.forward();
          }
        },),

      ],
    ),);
  }
}

class GrowTransition extends StatelessWidget {

  GrowTransition({this.child,this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(child: AnimatedBuilder(animation: animation,
        child: child,
        builder: (BuildContext context, Widget child){
          return Container(width: animation.value,height: animation.value,child: child,);
    }),);
  }

}