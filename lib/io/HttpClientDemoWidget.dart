import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class HttpClientDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpClientDemoState();
  }

}

class HttpClientDemoState extends State<HttpClientDemoWidget> {

  String _content;


  Future<String> _getBaiduContent() async {
      String content = "正在请求......";
      setState(() {
        _content = content;
      });
      try {

        HttpClient client = HttpClient();

        Uri url = Uri(scheme: "http", host: "www.baidu.com", queryParameters: {
          "name": "zhangsan"
        });
        HttpClientRequest request = await client.getUrl(url);
        request.headers.add("user-agent", "test");

        HttpClientResponse response = await request.close();

        content = await response.transform(utf8.decoder).join();

        client.close();

      }catch (e){
        debugPrint("$e");
        content = e.toString();
      }
      setState(() {
        _content = content;
      });

      return content;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("HttpClient例子"),),body: SingleChildScrollView(
      child: Container(padding: EdgeInsets.all(16),child: Column(children: <Widget>[
        RaisedButton(child: Text("请求一下"),onPressed: (){
          _getBaiduContent();
        },),
        Text("$_content")
      ],),),
    ),);
  }

}