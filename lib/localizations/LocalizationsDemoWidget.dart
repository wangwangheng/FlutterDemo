import 'package:flutter/material.dart';

class LocalizationsDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocalizationsDemoState();
  }
}

class LocalizationsDemoState extends State<LocalizationsDemoWidget> {
  @override
  Widget build(BuildContext context) {
    return Localizations(child: Scaffold(appBar: AppBar(title: Text(""),),),locale: Locale("zh","CN"),);

  }

}