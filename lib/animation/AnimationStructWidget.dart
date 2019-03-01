import 'package:flutter/material.dart';
import 'package:flutter_app/WidgetUtils.dart';

class AnimationStructWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationStructState();

}

class AnimationStructState extends State<AnimationStructWidget> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _animation;
  double _scale = 1.0;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animation = Tween(begin: 1.0,end: 0.3).animate(_controller)..addListener((){
      setState(() {
        _scale = _animation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return createScaffold("动画结构", Stack(children: <Widget>[
      Center(child: Image.network("http://pic32.photophoto.cn/20140915/0034034424700073_b.jpg"),widthFactor: _scale,heightFactor: _scale,),

      Center(child: RaisedButton(child: Text("开始动画"),onPressed: (){
          if(!_controller.isAnimating){
            _controller.reset();
            _controller.forward();
          }
      },)),
    ],));
  }
}