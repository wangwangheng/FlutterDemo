import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {

  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(()=>{
      debugPrint("addListener --- _emailController.text:${_emailController.text}")
    });

    _emailController.text = "HelloWorld";
    _emailController.selection = TextSelection(baseOffset: 2,extentOffset: _emailController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SecondPage"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.orange,fontSize: 24),
                  prefixIcon: Icon(Icons.email),
                  hintText: "please input email address",
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0,style: BorderStyle.solid))),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green,fontSize: 20),
              maxLines: 1,
              maxLength: 20,
              cursorWidth: 3,
              cursorRadius: Radius.circular(3),
              cursorColor: Colors.red,
              obscureText: false,
              onChanged: (String text) => {
                debugPrint("onChange:$text")
              },

            ),

            FlatButton(onPressed: (){
              debugPrint("email:" + _emailController.text);
            },child: Text("获取E-mail"),),

        ],
      ),

    );
  }

}