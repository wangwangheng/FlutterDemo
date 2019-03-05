import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

class DioDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DioDemoState();
  }
}

class DioDemoState extends State<DioDemoWidget> {

  Dio _dio = Dio();

  @override
  void dispose() {
    _dio.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Dio库实例"),),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Container(padding: EdgeInsets.all(16),
          child: Column(children: <Widget>[
            FlatButton(child: Text("一个简单实例:https://github.com/flutterchina/dio/blob/master/README-ZH.md"),onPressed: (){
              _simpleRequestBaidu();
            },),
          ],),),),);
  }

  void _simpleRequestBaidu() async{
    try{
      Response response = await _dio.get("http://www.baidu.com");
      debugPrint("$response");
    }catch(e){
      debugPrint(e);
    }
  }

}