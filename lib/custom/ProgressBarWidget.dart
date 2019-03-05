import 'package:flutter/material.dart';
import 'dart:math';
import 'TurnBoxWidget.dart';

class ProgressBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProgressBarState();
  }

}

class ProgressBarState extends State<ProgressBarWidget>
    with TickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("进度条"),),body: SingleChildScrollView(
    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    AnimatedBuilder(animation: _controller,builder: (BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
      children: <Widget>[
        Wrap(
          spacing: 10.0,
          runSpacing: 16.0,
          children: <Widget>[
            ProgressWidget(
              // No gradient
              colors: [Colors.blue, Colors.blue],
              radius: 50.0,
              strokeWidth: 3.0,
              value: _controller.value,),
            ProgressWidget(
              colors: [Colors.red, Colors.orange],
              radius: 50.0,
              strokeWidth: 3.0,
              value: _controller.value,),
            ProgressWidget(
              colors: [Colors.red, Colors.orange, Colors.red],
              radius: 50.0,
              strokeWidth: 5.0,
              value: _controller.value,),
            ProgressWidget(
              colors: [Colors.teal, Colors.cyan],
              radius: 50.0,
              strokeWidth: 5.0,
              strokeCapRound: true,
              value: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.decelerate).value,),
            TurnBox(
              turns: 1 / 8,
              child: ProgressWidget(
                  colors: [Colors.red, Colors.orange, Colors.red],
                  radius: 50.0,
                  strokeWidth: 5.0,
                  strokeCapRound: true,
                  backgroundColor: Colors.red[50],
                  totalAngle: 1.5 * pi,
                  value: CurvedAnimation(
                      parent: _controller,
                      curve: Curves.ease).value),),
            RotatedBox(
              quarterTurns: 1,
              child: ProgressWidget(
                  colors: [Colors.blue[700], Colors.blue[200]],
                  radius: 50.0,
                  strokeWidth: 3.0,
                  strokeCapRound: true,
                  backgroundColor: Colors.transparent,
                  value: _controller.value),),
            ProgressWidget(
              colors: [
                Colors.red,
                Colors.amber,
                Colors.cyan,
                Colors.green[200],
                Colors.blue,
                Colors.red
              ],
              radius: 50.0,
              strokeWidth: 5.0,
              strokeCapRound: true,
              value: _controller.value,
            ),],),
          ProgressWidget(
              colors: [Colors.blue[700], Colors.blue[200]],
              radius: 100.0,
              strokeWidth: 20.0,
              value: _controller.value,
          ),

          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ProgressWidget(
              colors: [Colors.blue[700], Colors.blue[300]],
              radius: 100.0,
              strokeWidth: 20.0,
              value: _controller.value,
              strokeCapRound: true,),),
          //剪裁半圆
          ClipRect(
            child: Align(
            alignment: Alignment.topCenter,
            heightFactor: .5,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                //width: 100.0,
                child: TurnBox(
                turns: .75,
                child: ProgressWidget(
                    colors: [Colors.teal, Colors.cyan[500]],
                    radius: 100.0,
                    strokeWidth: 8.0,
                    value: _controller.value,
                    totalAngle: pi,
                    strokeCapRound: true,),),),),),),
          SizedBox(
            height: 104.0,
            width: 200.0,
            child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                      height: 200.0,
                      top: .0,
                      child: TurnBox(
                          turns: .75,
                          child: ProgressWidget(
                              colors: [Colors.teal, Colors.cyan[500]],
                              radius: 100.0,
                              strokeWidth: 8.0,
                              value: _controller.value,
                              totalAngle: pi,
                              strokeCapRound: true,),),),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                            child: Text("${(_controller.value * 100).toInt()}%",style: TextStyle(fontSize: 25.0,color: Colors.blueGrey,),),)
                ],),),
          ],),);},
      ),],),),);
    }
  }

  class ProgressWidget extends StatelessWidget {

      ProgressWidget({
        this.strokeWidth = 2.0,
        @required this.radius,
        @required this.colors,
        this.stops,
        this.strokeCapRound = false,
        this.backgroundColor = const Color(0xFFEEEEEE),
        this.value = 0,
        this.totalAngle = 2 * pi,
      });

      final double strokeWidth;
      final double radius;
      final List<Color> colors;
      final List<double> stops;
      final bool strokeCapRound;
      final Color backgroundColor;
      final double value;
      final double totalAngle;

      @override
      Widget build(BuildContext context) {

      double _offset = .0;
      // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
      // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
      if (strokeCapRound) {
        _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
      }

      var _colors = colors;
      if(_colors == null){
        var color = Theme.of(context).accentColor;
        _colors = [color,color];
      }


      return Transform.rotate(
          angle: -pi /2 - _offset,
          child: CustomPaint(
          size: Size.fromRadius(radius),
          painter: ProgressBar(
            strokeWidth: strokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            totalAngle: totalAngle,
            stops: stops,
            colors: _colors,
            radius: radius
          ),
        ),
      );

    }
  }

  class ProgressBar extends CustomPainter {

    ProgressBar({
      this.strokeWidth = 10.0,
      @required this.radius,
      @required this.colors,
      this.stops,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.value = 0,
      this.totalAngle = 2 * pi,
    });

    final double strokeWidth;
    final double radius;
    final List<Color> colors;
    final List<double> stops;
    final bool strokeCapRound;
    final Color backgroundColor;
    final double value;
    final double totalAngle;

    @override
    void paint(Canvas canvas, Size size) {
      if(radius != null){
        size = Size.fromRadius(radius);
      }

      double _offset = strokeWidth / 2;

      double _value = value ?? 0.0;
      _value = _value.clamp(.0, 1.0) * totalAngle;

      double _start = 0.0;
      if (strokeCapRound) {
        _start = asin(strokeWidth / (size.width - strokeWidth));
      }

      Rect rect = Offset(_offset, _offset) & Size(
      size.width - strokeWidth,
      size.height - strokeWidth
      );

      var paint = Paint()..strokeWidth = strokeWidth
        ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
        ..style = PaintingStyle.stroke
        ..isAntiAlias = true;
      if(backgroundColor != Colors.transparent){
        paint.color = backgroundColor;
        canvas.drawArc(rect, _start, totalAngle, false, paint);
      }

      if(_value > 0){
      paint.shader = SweepGradient(startAngle: _start,endAngle: _value,colors: colors,stops:stops)
          .createShader(rect);
      }


    canvas.drawArc(rect, _start, _value, false, paint);


    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
    }

}