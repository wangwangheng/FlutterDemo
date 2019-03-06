import 'dart:core';

class User {
  String name;
  String email;

  User(this.name,this.email);

  Map<String,dynamic> toJson(){
    return <String,dynamic>{
      'name' : name,
      'email' : email
    };
  }

  User.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
  }

  @override
  String toString() {
    return "姓名:$name,邮箱:$email";
  }
}