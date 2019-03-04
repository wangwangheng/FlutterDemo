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
      child: Column(children: <Widget>[
        GroupWidget(colors: [Colors.red,Colors.blue],height: 50,width: 360,child: Text("Hello"),onTap: (){debugPrint("11111111111111111");},),
        GroupWidget(colors: [Colors.orange,Colors.green],height: 50,width: 360,child: Text("World"),onTap: (){debugPrint("22222222");},),
        GroupWidget(colors: [Colors.grey,Colors.purpleAccent],height: 50,width: 360,child: Text("Cat"),onTap: (){debugPrint("Cat");},),
        GroupWidget(colors: [Colors.yellow,Colors.brown],height: 50,width: 360,child: Text("Dog"),onTap: (){debugPrint("Dog");},),
        GroupWidget(colors: [Colors.teal,Colors.cyan],height: 50,width: 360,child: Text("People"),onTap: (){debugPrint("Human");},),
      ]),
    ),);
  }

}


class GroupWidget extends StatelessWidget {

  GroupWidget({this.colors,this.width,this.height,this.onTap,this.child});

  List<Color> colors;
  final double width;
  final double height;
  GestureTapCallback onTap;
  Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ?? [theme.primaryColor,theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: _colors)),
      child: Material(type: MaterialType.transparency,
        child: InkWell(splashColor: _colors.last, highlightColor: Colors.transparent,
        onTap: onTap,
        child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: width,height: height),
                  child: Padding(padding: EdgeInsets.all(8),
                          child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold), child: child)),),),
        ),
    );
  }

}