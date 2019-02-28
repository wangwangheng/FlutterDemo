import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';
import 'FormPage.dart';
import 'layout/LinearLayout.dart';
import 'layout/FlexLayout.dart';
import 'layout/FlowLayout.dart';
import 'container/ContainerLayout.dart';
import 'container/ContainerSampleLayout.dart';
import 'container/DrawerLayout.dart';
import 'scrollable/SingleChildScrollViewLayout.dart';
import 'scrollable/ListViewWidget.dart';
import 'scrollable/CustomScrollViewWidget.dart';
import 'DoubleBackUtils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.blue,
        primarySwatch: Colors.deepPurple,
        primaryColor: Color(0xFF336699),
      ),
      home: MyHomePage(title: 'First Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBackUtils.createDoubleBackWidget(Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter * _counter}',
              style: Theme.of(context).textTheme.display1,
            ),
            Row(children:<Widget>[
                  Spacer(),
                  RaisedButton(child: Text("NewRouter"),textColor:Colors.white,onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return NewRouter();
                    }));
                  },),
                  Spacer(),
                  RaisedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
                  },child: Text("SecondPage"),),

                  Spacer(),
                  RaisedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
                  },child: Text("ThirdPage"),),
                 Spacer(),
              ],mainAxisAlignment: MainAxisAlignment.center,),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage()));
                },child: Text("FormPage"),),
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LinearLayout()));
                },child: Text("线性布局"),),Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FlexLayout()));
                },child: Text("弹性布局"),),
                Spacer(),
              ],),


            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FlowLayout()));
                },child: Text("流式布局"),),
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContainerLayout()));
                },child: Text("容器View"),),
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContainerSampleLayout()));
                },child: Text("Container组合容器"),),
                Spacer(),
              ],),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerLayout()));
                },child: Text("DrawerLayout"),),
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChildScrollViewLayout()));
                },child: Text("SingleChildScrollView"),),
                Spacer(),
              ],),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewWidget()));
                },child: Text("ListView"),),
                Spacer(),
                RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CustomScrollViewWidget()));
                },child: Text("CustomScrollView"),),
                Spacer(),
              ],),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}

class NewRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(title: Text("NewRouter"),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Random Word from english_words:"),
          Text(wordPair.toString(),style: TextStyle(color: Color(0xFFFF0000),fontSize: 25),),
          RaisedButton(onPressed: (){
            Navigator.pop(context);
          },),
        ],
      ),),
    );
  }

}
