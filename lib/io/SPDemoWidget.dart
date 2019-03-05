import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SPDemoState();
  }

}

class SPDemoState extends State<SPDemoWidget> {
  static const _KEY_COUNTER = "key_counter";
  int _counter;

  @override
  void initState(){
    super.initState();

    _getCounter().then((value){
      setState(() {
        _counter = value;
      });
    });
  }

  Future<int> _getCounter() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(_KEY_COUNTER) ?? 0;
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(_KEY_COUNTER, _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("SharedPreferences读写"),),body: Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
        Text("$_counter",style: TextStyle(color: Colors.purpleAccent,fontSize: 24,fontWeight: FontWeight.bold),),
        RaisedButton(child: Text("写入文件"),onPressed: (){
          _incrementCounter();

        },)
      ],),
    ),);
  }

}