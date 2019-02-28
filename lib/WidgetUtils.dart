import 'package:flutter/material.dart';

Scaffold createScaffold(String title,Widget body){
  return Scaffold(appBar: AppBar(title: Text(title),),body: body,);
}