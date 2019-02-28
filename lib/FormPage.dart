import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {


  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _createScaffold(context);
  }

  Scaffold _createScaffold(BuildContext context){
    Scaffold scaffold = Scaffold(
      appBar: AppBar(title: Text("FormPage"),),
      body: Form(
        key:_formKey,
        autovalidate: true,
        child: Padding(padding: EdgeInsets.all(16) ,
            child:Column(mainAxisAlignment: MainAxisAlignment.center,children:_createColumnChildren(context))),
        ),
    );
    return scaffold;
  }


  _createColumnChildren(BuildContext context) {
    return <Widget>[
        TextFormField(autofocus: true,
          controller: _controller1,
          decoration: InputDecoration(hintText: "请输入用户名",labelText: "用户名",icon: Icon(Icons.account_circle)),
          validator: (v){
              return v.trim().length > 0 ? null : "用户名不能为空";
          },
        ),
      
      TextFormField(autofocus: false,
        controller: _controller2,
        decoration: InputDecoration(hintText: "请输入密码",labelText: "密码",icon: Icon(Icons.lock)),
        obscureText: true,
        validator: (v){
            return v.trim().length > 5 ? null : "密码至少六位";
        },
      ),

      Padding(padding: EdgeInsets.only(top: 28),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Builder(builder: (context){return RaisedButton(onPressed: (){
              // 在这里不能通过此方式获取FormState，context不对
              //print(Form.of(context));

              // 通过_formKey.currentState 获取FormState后，
              // 调用validate()方法校验用户名密码是否合法，校验
              // 通过后再提交数据。
              if((_formKey.currentState as FormState).validate()){
                   //验证通过提交数据
                   debugPrint("验证通过 ，用户名:${_controller1.text},密码：${_controller2.text}");
              }else{
                debugPrint("验证未通过 ，用户名:${_controller1.text},密码：${_controller2.text}");
              }
            },child: Text("登录"),
                padding: EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
              textColor: Colors.white,
                );
              }
          ),
        Spacer(),
          Builder(builder: (context) {
            return RaisedButton(onPressed: () {
              FormState state = _formKey.currentState as FormState;
              state.reset();
            },
              child: Text("清空"),
              textColor: Colors.white,
              padding: EdgeInsets.all(12),
              color: Colors.red,);
          }),
        Spacer(),
      ],),)
    ];
  }

}


