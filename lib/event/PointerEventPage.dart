import 'package:flutter/material.dart';
import 'package:flutter_app/WidgetUtils.dart';

class PointerEventPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Event();


}

class _Event extends State<PointerEventPage> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return createScaffold("PointerEvent", Listener(
      onPointerDown: (PointerDownEvent event){setState(() {
        _event = event;
      });},
      onPointerMove: (PointerMoveEvent event){setState(() {
        _event = event;
      });},
      onPointerUp: (PointerUpEvent event){setState(() {
        _event = event;
      });},
      onPointerCancel: (PointerCancelEvent event){setState(() {
        _event = event;
      });},
      child: Padding(padding: EdgeInsets.all(8),child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(flex:1 ,child: Text("${_event != null ? _event.toString() : "没有事件"}")),
      ],
    ),)));
  }

}