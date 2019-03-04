import 'package:flutter/material.dart';

class StaggerAnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerAnimationState();
  }

}

class StaggerAnimationState extends State<StaggerAnimationWidget> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {

    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("交错动画:StaggerAnimation"),),body: Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(16),
      child: GestureDetector(behavior: HitTestBehavior.opaque,
        onTap: () async{
          try {
            //先正向执行动画
            await _controller.forward().orCancel;
            //再反向执行动画
            await _controller.reverse().orCancel;
          } on TickerCanceled {
            // the animation got canceled, probably because we were disposed
          }
        },
        child: Center(
          child: Container(width: 300,height: 300,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1),
                border: Border.all(color: Colors.black.withOpacity(0.5),)),
            child: AnimationRect(controller: _controller,),
          ),
        ),)),);
  }
}


class AnimationRect extends StatelessWidget {

  AnimationRect({Key key,this.controller}) : super(key: key){
    _heightAnim = Tween(begin: 0.0,end: 300.0)
          .animate(CurvedAnimation(parent: controller, curve: Interval(0.0,0.6,curve: Curves.ease)));
    _colorAnim = ColorTween(begin: Colors.red,end: Colors.blue)
          .animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.6,curve: Curves.ease)));
    _paddingAnim = Tween(begin: EdgeInsets.only(left: 0),end: EdgeInsets.only(left: 100))
          .animate(CurvedAnimation(parent: controller, curve: Interval(0.6, 1.0,curve: Curves.ease)));
  }

  final AnimationController controller;
  Animation<double> _heightAnim;
  Animation<Color> _colorAnim;
  Animation<EdgeInsets> _paddingAnim;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller,builder: (BuildContext context,Widget child){
      return Container(
        alignment: Alignment.bottomCenter,
        padding: _paddingAnim.value,
        child: Container(color: _colorAnim.value,height: _heightAnim.value,width: 50,),
      );
    },);
  }

}