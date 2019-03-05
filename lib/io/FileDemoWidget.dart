import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FileDemoState();
  }

}

class FileDemoState extends State<FileDemoWidget> {

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

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File("$dir/counter.txt");
  }

  Future<int> _getCounter() async {
    try {
      File file = await _getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    } on IOException {
      debugPrint("IOException on _getCounter()");
    }
    return 0;
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    try {
      File file = await _getLocalFile();
      file.writeAsString("$_counter");
    } on IOException {
      debugPrint("IOException on _incrementCounter()");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("文件读写"),),body: Container(
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