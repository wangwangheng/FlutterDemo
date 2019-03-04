import 'package:flutter/material.dart';

class RouteTransitionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteTransitionState();
  }

}

class RouteTransitionState extends State<RouteTransitionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("路由切换动画"),),body: Padding(padding: EdgeInsets.all(16),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(child: Text("MaterialPageRoute"),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return RouteTransitionTargetWidget();
            }));
          },),
          RaisedButton(child: Text("PageRouteBuilder"),onPressed: (){
            Navigator.push(context, PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                return FadeTransition(opacity: animation,child: RouteTransitionTargetWidget(),);
            }));
          },),
          RaisedButton(child: Text("CustomFadeRoute"),onPressed: (){
              Navigator.push(context, CustomFadeRoute(builder: (context){
                return RouteTransitionTargetWidget();
              }));
          },),
        ],
      ),));
  }
}

class RouteTransitionTargetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("自定义路由动画目标页面"),),body: Container(
      color: Colors.blueGrey,
      child: Text("哈哈哈哈哈哈哈哈",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
    ),);
  }
}

class CustomFadeRoute extends PageRoute {

  CustomFadeRoute({@required this.builder,});

  final WidgetBuilder builder;

  @override
  Color get barrierColor => Colors.red;

  @override
  String get barrierLabel => "HelloWorld";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation,child: builder(context),);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 1000);

}