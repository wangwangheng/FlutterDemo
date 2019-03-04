import 'package:flutter/material.dart';
import 'package:flutter_app/WidgetUtils.dart';


class ContainerSampleLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContainerSampleLayoutState();
}

class ContainerSampleLayoutState extends State<ContainerSampleLayout> with SingleTickerProviderStateMixin<ContainerSampleLayout> {
  int _selectedIndex = 1;
  TabController _tabController;
  List<String> _tabs = ["新闻","历史","图片","小说","财经"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener((){
      debugPrint("Tab当前选中tab:${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Container - 组合容器"),actions: <Widget>[
      IconButton(icon: Icon(Icons.share),onPressed: (){
        debugPrint("点击顶部分享按钮");
      },),
      IconButton(icon: Icon(Icons.message),onPressed: (){
        debugPrint("点击顶部消息按钮");
      },),
    ],bottom: TabBar(
        tabs: _tabs.map((e)=> Tab(text: e)).toList(),
        indicatorColor: Colors.green,
        indicatorWeight: 5,
        unselectedLabelColor: Colors.grey,
        controller: _tabController
        ),
    ),
//        body: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
//
//        Container(
//          constraints: BoxConstraints(minHeight: 50,minWidth: 50,maxWidth: double.infinity),
//          alignment: Alignment.center,
////          padding: EdgeInsets.all(20),
//          margin: EdgeInsets.all(20),
//          width: 250,
//          height: 50,
////          color: Colors.red,
//          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5) ,gradient: LinearGradient(colors: [Colors.green,Colors.blue]),
//            boxShadow: [BoxShadow(color: Color(0x3F000000),offset: Offset(2.0,2.0),blurRadius: 4)],),
//          child: Text("Hello World",style: TextStyle(color: Colors.white),),
//
//        ),
//
//
//    ],),
      body: TabBarView(controller: _tabController,children: _tabs.map((e){
        return Container(alignment: Alignment.center,child: Text(e,textScaleFactor: 3,),);
      }).toList()),

      drawer: Container(color: Colors.white,width: 240,child: Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
          Image.network("https://img.zcool.cn/community/011419598181890000002129e18ef0.jpg@2o.jpg"),
          Padding(padding: EdgeInsets.all(16),),
          Text("关于我们",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w700),)
      ],)),

      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
        BottomNavigationBarItem(icon: Icon(Icons.business),title: Text("Business")),
        BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("School")),
      ],currentIndex: _selectedIndex,
//      fixedColor: Colors.green,
      onTap: (index){
        debugPrint("前一个索引:$_selectedIndex,当前选中索引:$index");
        setState(() {
          _selectedIndex = index;
        });
      },),
      
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),backgroundColor: Colors.cyan,onPressed: (){
        debugPrint("Floating Action Button click");
        Navigator.pop(context);
      },),
    );
  }

}