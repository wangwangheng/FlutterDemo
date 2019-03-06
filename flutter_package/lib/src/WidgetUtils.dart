import 'package:flutter/material.dart';

/// Widget的工具类:为了方便创建Widget
class WidgetUtils{
  static Widget createPaddingScaffold(String title,Widget body){
    return Scaffold(appBar: AppBar(title: Text(title),),body: Container(
      padding: EdgeInsets.all(16),
      child: body,
    ),);
  }

  static Widget createScrollableScaffold(String title,Widget body){
    return Scaffold(appBar: AppBar(title: Text(title),),body: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: body,
    ),);
  }
}