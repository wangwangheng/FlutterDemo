import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    super.initState();

    _focusNode1.addListener(() => {
      debugPrint("第一个文本输入框是否有焦点:${_focusNode1.hasFocus}")
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("ThirdPage"),),
      body: Padding(padding: EdgeInsets.all(16),child: Column(children: <Widget>[
        Theme(data: Theme.of(context).copyWith(hintColor: Colors.grey[200],
                inputDecorationTheme: InputDecorationTheme(labelStyle: TextStyle(color: Colors.cyan),hintStyle: TextStyle(color: Colors.red))),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:[
              TextField(focusNode: _focusNode1,autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "请输入姓名",
//                    hintStyle: TextStyle(decorationColor: Colors.orange,color: Colors.cyan),
                    border: UnderlineInputBorder(borderSide: BorderSide(color:Colors.red,width: 4.0)),
              ),),
              TextField(focusNode: _focusNode2,decoration: InputDecoration(labelText: "Phone",hintText: "请输入手机号码"),)
        ])
        ),

        Builder(builder: (ctx){
          return Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[

            FlatButton(child: Text("第二个获取焦点"),onPressed: (){
              if(_focusScopeNode == null){
                _focusScopeNode = FocusScope.of(context);
              }
              _focusScopeNode.requestFocus(_focusNode2);
            },),

            FlatButton(child: Text("两个按钮都失去焦点"),onPressed: (){
              _focusNode1.unfocus();
              _focusNode2.unfocus();
            },)

          ],);
        }),




      ],),),
    );
  }

}