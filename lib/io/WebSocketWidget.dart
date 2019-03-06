import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart';
import 'package:english_words/english_words.dart';

class WebSocketWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebSocketState();
  }
}

class WebSocketState extends State<WebSocketWidget> {

  WebSocketChannel _channel;

  @override
  void initState() {
    _channel = IOWebSocketChannel.connect("ws://echo.websocket.org");
    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("WebSocket测试"),),body: Container(
      padding: EdgeInsets.all(16),
      child: Column(children: <Widget>[
        
        StreamBuilder(stream: _channel.stream,builder: (context,snapshot){
          String _text = "等待数据....";
          if(snapshot.hasError){
            _text = snapshot.error.toString();
          }else if(snapshot.hasData){
            _text = "接收数据:${snapshot.data}";
          }else{
            _text = "未知状态";
          }
          return Text(_text);
        }),

        RaisedButton(child: Text("发送数据"),onPressed: (){
          String words = WordPair.random().asCamelCase;
          debugPrint("发送的数据:$words");
          _channel.sink.add(words);
        },)
        
      ],),
    ));
  }

}