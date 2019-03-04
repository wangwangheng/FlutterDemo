import 'package:flutter/material.dart';

class ComposeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ComposeState();
  }

}

class ComposeState extends State<ComposeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("组合Widget"),),body: Container(
      padding: EdgeInsets.all(16),
      child: GroupWidget(),
    ),);
  }

}


class GroupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}