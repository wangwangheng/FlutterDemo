import 'package:flutter/material.dart';
import 'dart:convert';
import 'User.dart';

class JsonDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JsonDemoState();
  }
}

class JsonDemoState extends State<JsonDemoWidget> {
  String _internalJsonResult = "";
  String _userString = "";
  User _user = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Json示例"),),body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(children: <Widget>[
        RaisedButton(child: Text("内置JSON解析"),onPressed: (){
          String str = '[{"name":"Jack"},{"name":"Rose"}]';
          List list = json.decode(str);
          setState(() {
            _internalJsonResult = "解析结果:${list[0]['name']}";
          });
        },),

        Text(_internalJsonResult),

        RaisedButton(child: Text("User转换为Json"),onPressed: (){
          User user = User("zhangsan", "526626126@qq.com");
          String result = json.encode(user);
          setState(() {
            _userString = result;
          });
        },),

        Text(_userString),

        RaisedButton(child: Text("Json转换为User"),onPressed: (){

          User result = User.fromJson(json.decode('{"name":"李四","email":"496303403@qq.com"}'));
          setState(() {
            _user = result;
          });
        },),

        Text(_user == null ? "请点击按钮开始转换" : _user.toString() ),



      ],),
    ),);
  }

}