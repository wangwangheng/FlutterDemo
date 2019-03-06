import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';


class SocketDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SocketDemoState();
  }

}

class SocketDemoState extends State<SocketDemoWidget> {

  String _requestContent = "正在请求...";

  void _requestBaidu() async {
    Socket socket;
    try{
      socket = await Socket.connect("baidu.com", 80);
        //根据http协议，发送请求头
        socket.writeln("GET / HTTP/1.1");
        socket.writeln("Host:baidu.com");
        socket.writeln("Connection:close");
        socket.writeln();
        await socket.flush(); //发送
        //读取返回内容
        String content = await socket.transform(utf8.decoder).join();
        setState(() {
          _requestContent = content;
        });

    }catch(e){
      setState(() {
        _requestContent = "请求失败$e";
      });
    }finally {
      socket.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Socket示例"),),
      body: SingleChildScrollView(padding: EdgeInsets.all(16),child: Column(children: <Widget>[
        RaisedButton(child: Text("请求baidu"),onPressed: (){
          _requestBaidu();
        },),
        Text(_requestContent),
      ],),),);
  }
}