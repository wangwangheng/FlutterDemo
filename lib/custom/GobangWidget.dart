import 'package:flutter/material.dart';

class GobangWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GobangState();
  }
}

class GobangState extends State<GobangWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("五子棋棋盘绘制"),),body:
    Center(child: CustomPaint(painter: Gobang(),size: Size(300, 300),),));
  }
}

class Gobang extends CustomPainter {

  static const double _POINT_RADIUS = 10.0;
  static const int _ROW_COLUMN_COUNT = 15;

  Paint _linePaint;
  Paint _backgroundPaint;
  Paint _blackPaint;
  Paint _whitePaint;

  Gobang(){
    _backgroundPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);

    _linePaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.2;

    _blackPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    _whitePaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.white;

  }


  @override
  void paint(Canvas canvas, Size size) {
    // 绘制background
    canvas.drawRect(Offset.zero & size, _backgroundPaint);

    // 绘制线
    double perWidth = size.width / _ROW_COLUMN_COUNT;
    double perHeight = size.height / _ROW_COLUMN_COUNT;

    for(int i = 0; i <= _ROW_COLUMN_COUNT;i++){
      canvas.drawLine(Offset(0, perHeight * i), Offset(size.width, perHeight * i), _linePaint);
      canvas.drawLine(Offset(perWidth * i, 0), Offset(perWidth * i, size.height), _linePaint);
    }

    // 绘制黑色和白色的点

    Offset blackOffset = Offset(8 * perWidth, 8 * perHeight);
    canvas.drawCircle(blackOffset, _POINT_RADIUS, _blackPaint);

    Offset whiteOffset = Offset(5 * perWidth,12 * perHeight);
    canvas.drawCircle(whiteOffset, _POINT_RADIUS, _whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}