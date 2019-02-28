import 'package:flutter/material.dart';

// 两次点击返回工具类
class DoubleBackUtils {
  static DateTime _lastBackTime;

  static WillPopScope createDoubleBackWidget(Widget child){
    return WillPopScope(child: child,onWillPop: () async {
      if (_lastBackTime == null || DateTime.now().difference(_lastBackTime) > Duration(seconds: 1)) {
        //两次点击间隔超过1秒则重新计时
        _lastBackTime = DateTime.now();
        debugPrint("两次点击事件间隔太大");
        return false;
      }
      return true;
    },);
  }
}