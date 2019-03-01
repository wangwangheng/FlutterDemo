import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListViewWidgetState();
}

class ListViewWidgetState extends State<ListViewWidget> {
  final int _KEY_LIST_STATE = 1;

  final _loadingTag = "##loading##"; //表尾标记
  final List<String> _list = List();
  final ScrollController _controller = ScrollController(keepScrollOffset: true);
  var _showToTop = false;

  @override
  void initState() {
    super.initState();
    _list.clear();
    _list.add(_loadingTag);
    _controller.addListener((){
      if(_controller.offset < 1000 && _showToTop){
         setState(() {
           _showToTop = false;
         });
      }else if(_controller.offset >= 1000 && !_showToTop){
        setState(() {
          _showToTop = true;
        });
      }
      debugPrint("current offset:${_controller.offset}");

    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("ListView"),),body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Image.network("https://img.zcool.cn/community/011419598181890000002129e18ef0.jpg@2o.jpg"),
          Expanded(child: NotificationListener(
            onNotification: (notification){
              handleNotification(notification);
            },
              child: buildListView(context))),
    ],),floatingActionButton: !_showToTop ? null : FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      onPressed: (){
        _controller.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
      },
    ),);
  }



  ListView buildListView(BuildContext context) {

    Divider divider1 = Divider(color:Colors.blue,height: 1,);
    Divider divider2 = Divider(color:Colors.orange,height: 1,);

    return ListView.separated(
      key: PageStorageKey(_KEY_LIST_STATE),
        controller: _controller,
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: ClampingScrollPhysics(),
        itemCount: _list.length,
        itemBuilder: (BuildContext context,int index){
          if(_list[index] == _loadingTag){
            if(_list.length < 100){
              _loadData();
              return Container(padding:EdgeInsets.all(16),alignment: Alignment.center,
                child: SizedBox(child: CircularProgressIndicator(strokeWidth: 5,backgroundColor: Colors.orange,),),);
            }else{
              return Container(padding: EdgeInsets.all(16),alignment: Alignment.center,child: Text("没有更多数据了",style: TextStyle(color: Colors.grey),),);
            }
          }

          return ListTile(title: Text("item:$index"),);
        },
        separatorBuilder: (BuildContext context, int index){
          if(index % 2 == 0){
            return divider1;
          }else{
            return divider2;
          }
        },

    );
  }

  void _loadData() {
    Future.delayed(Duration(seconds: 2)).then((v){
      _list.insertAll(_list.length - 1, generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {

      });
    });
  }

  void handleNotification(notification) {
    switch(notification.runtimeType){
      case ScrollStartNotification:{
        debugPrint("handleNotification#ScrollStartNotification");
      }break;
      case ScrollEndNotification:{
        debugPrint("handleNotification#ScrollEndNotification");
      }break;
      case ScrollUpdateNotification:{
        debugPrint("handleNotification#ScrollUpdateNotification");
      }break;
      case OverscrollNotification:{
        debugPrint("handleNotification#OverscrollNotification");
      }break;
      default: {
        debugPrint("handleNotification#default");
      }
    }
  }

}