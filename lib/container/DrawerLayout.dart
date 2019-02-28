import 'package:flutter/material.dart';

class DrawerLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrawerLayoutState();
}

class DrawerLayoutState extends State<DrawerLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("DrawerLayout"),),drawer: MyDrawer(),);
  }
}

class MyDrawer extends StatelessWidget {
  MyDrawer({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(elevation: 16,child:
    MediaQuery.removePadding(context: context, removeTop:true,
        child: Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 38),child: Row(children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: ClipOval(child:
              Image.network("https://img.zcool.cn/community/011419598181890000002129e18ef0.jpg@2o.jpg",width: 60,),),),
              Text(
                "Wendux",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],),),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                    onTap: (){

                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                    onTap: (){

                    },
                  ),
                ],
              ),
            ),
    ],)),);
  }

}