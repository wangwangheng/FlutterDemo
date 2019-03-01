import 'package:flutter/material.dart';
import 'package:flutter_app/WidgetUtils.dart';

class SingleDirectionDragWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SingleDirectionDragState();
}

class SingleDirectionDragState extends State<SingleDirectionDragWidget> {
  double _left = 0;
  double _top = 0;

  @override
  Widget build(BuildContext context) {
    return createScaffold(
        "SingleDirectionDrag",
        Stack(
          children: <Widget>[
            Positioned(
              left: _left,
              top: _top,
              child: Listener(
                  onPointerDown: (PointerDownEvent event) {
                    debugPrint("onPointerDown");
                  },
                  onPointerUp: (PointerUpEvent event) {
                    debugPrint("onPointerUp");
                  },
                  child: GestureDetector(
                    child: CircleAvatar(
                      child: Text(
                        "A",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                      debugPrint("onHorizontalDragUpdate");
                      setState(() {
                        _left += details.delta.dx;
                      });
                    },
                    onHorizontalDragEnd: (DragEndDetails details) {
                      debugPrint("onHorizontalDragEnd");
                    },
                    onVerticalDragUpdate: (DragUpdateDetails details) {
                      debugPrint("onVerticalDragUpdate");
                      setState(() {
                        _top += details.delta.dy;
                      });
                    },
                    onVerticalDragEnd: (DragEndDetails details) {
                      debugPrint("onVerticalDragEnd");
                    },
                  )),
            ),
          ],
        ));
  }
}
