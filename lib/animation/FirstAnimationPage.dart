import 'package:flutter/material.dart';
import 'package:flutter_app/WidgetUtils.dart';

class FirstAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstAnimationState();

}

class FirstAnimationState extends  State<FirstAnimationPage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<int> _animation;
  double _alpha = 1;
  String _buttonText = "开始动画";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 2500));
    CurvedAnimation curve = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _animation = IntTween(begin: 0,end: 255).animate(curve);
    _animation.addListener((){
      setState(() {
        _alpha = _animation.value * 1.0 / 255;
        _buttonText = "动画执行中:$_alpha";
      });
    });
    _animation.addStatusListener((AnimationStatus status){
          String _status = "";
          switch(status){
            case AnimationStatus.forward:
              _status = "动画启动...";
              break;
            case AnimationStatus.dismissed:
              _status = "动画停止...";
              break;
            case AnimationStatus.reverse:
              _status = "动画停止...";
              break;
            case AnimationStatus.completed:
              _status = "开始动画";
              break;
          }
          setState(() {
            _buttonText = _status;
          });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold("Animation First", Stack(children: <Widget>[
      Opacity(opacity: _alpha,child: Image.network("http://pic32.photophoto.cn/20140915/0034034424700073_b.jpg"),),
      Center(child:RaisedButton(child: Text(_buttonText,style: TextStyle(color: Colors.white),),onPressed: (){
        if(!_controller.isAnimating){
          _controller.reset();
          _controller.forward();
        }
      },)),
    ],));
  }
}