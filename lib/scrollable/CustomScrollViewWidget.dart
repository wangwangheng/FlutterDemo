import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(child: CustomScrollView(slivers: <Widget>[
      SliverAppBar(pinned: true,expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network("http://pic39.photophoto.cn/20160411/1155116845138548_b.jpg",fit: BoxFit.cover,),
        ),title: Text("CustomScrollView"),),

      SliverPadding(padding: EdgeInsets.all(8),
        sliver: SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
            int colorIndex = 100 * (index % 9);
            Color color = colorIndex > 0 ? Colors.cyan[colorIndex] : Colors.orange;
            return Container(alignment: Alignment.center, color: color,child: Text("Item:$index",style: TextStyle(color: Colors.white),));
        },childCount: 20),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8)),),
      
      SliverFixedExtentList(itemExtent: 80,
        delegate: SliverChildBuilderDelegate((BuildContext context,int index){
          int colorIndex = 100 * (index % 9);
          Color color = colorIndex > 0 ? Colors.orange[colorIndex] : Colors.cyan;
          return Container(
            margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            color: color,
            child: Text("List Item index: $index",style: TextStyle(color: Colors.white),),);
        },childCount: 30,),),

    ],),);
  }

}