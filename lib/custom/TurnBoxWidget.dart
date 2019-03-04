import 'package:flutter/material.dart';

class TurnBoxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TurnBoxState();;
  }
}

class TurnBoxState extends State<TurnBoxWidget> {

  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("TurnBoxWidget"),),body: Column(children:<Widget>[
        TurnBox(
          turns: _turns,
          speed: 500,
          child: Icon(Icons.refresh, size: 50,),
        ),
        TurnBox(
          turns: _turns,
          speed: 1000,
          child: Icon(Icons.refresh, size: 150.0,),
        ),
        RaisedButton(
          child: Text("顺时针旋转1/5圈"),
          onPressed: () {
            setState(() {
              _turns += .2;
            });
          },
        ),
        RaisedButton(
          child: Text("逆时针旋转1/5圈"),
          onPressed: () {
            setState(() {
              _turns -= .2;
            });
          },
        )
    ]),);
  }

}

class TurnBox extends StatefulWidget {

  TurnBox({Key key,this.turns,this.speed,this.child}): super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _TBState();
  }
}

class _TBState extends State<TurnBox> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this,
        lowerBound: -double.infinity,
        upperBound: double.infinity
    );
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _controller,child: widget.child,);
  }


  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);


    if(oldWidget.turns != widget.turns){
      _controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 500),
          curve: Curves.easeOut);
    }
  }

}

