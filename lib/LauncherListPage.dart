import 'package:flutter/material.dart';

import 'DoubleBackUtils.dart';
import 'FormPage.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';
import 'WidgetUtils.dart';
import 'animation/AnimationStructWidget.dart';
import 'animation/AnimationWidget.dart';
import 'animation/FirstAnimationPage.dart';
import 'animation/GrowTransitionWidget.dart';
import 'animation/HeroAnimationWidget.dart';
import 'animation/RouteTransitionWidget.dart';
import 'animation/StaggerAnimationWidget.dart';
import 'container/ContainerLayout.dart';
import 'container/ContainerSampleLayout.dart';
import 'container/DrawerLayout.dart';
import 'custom/ComposeWidget.dart';
import 'custom/GobangWidget.dart';
import 'custom/ProgressBarWidget.dart';
import 'custom/TurnBoxWidget.dart';
import 'event/PointerEventPage.dart';
import 'event/SingleDirectionDragWidget.dart';
import 'io/DioDemoWidget.dart';
import 'io/FileDemoWidget.dart';
import 'io/HttpClientDemoWidget.dart';
import 'io/SPDemoWidget.dart';
import 'layout/FlexLayout.dart';
import 'layout/FlowLayout.dart';
import 'layout/LinearLayout.dart';
import 'scrollable/CustomScrollViewWidget.dart';
import 'scrollable/ListViewWidget.dart';
import 'scrollable/SingleChildScrollViewLayout.dart';
import 'io/WebSocketWidget.dart';
import 'io/SocketDemoWidget.dart';

class LauncherListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LauncherListState();
}

class LauncherListState extends State<LauncherListPage> {
  final _map = {
    "SecondPage": SecondPage(),
    "ThirdPage": ThirdPage(),
    "FormPage": FormPage(),
    "LinearLayout": LinearLayout(),
    "FlexLayout": FlexLayout(),
    "FlowLayout": FlowLayout(),
    "ContainerLayout": ContainerLayout(),
    "ContainerSampleLayout": ContainerSampleLayout(),
    "DrawerLayout": DrawerLayout(),
    "SingleChildScrollViewLayout": SingleChildScrollViewLayout(),
    "ListViewWidget": ListViewWidget(),
    "CustomScrollViewWidget": CustomScrollViewWidget(),
    "PointerEventPage": PointerEventPage(),
    "SingleDirectionDragWidget": SingleDirectionDragWidget(),
    "FirstAnimationPage": FirstAnimationPage(),
    "AnimationStructWidget": AnimationStructWidget(),
    "AnimationWidget": AnimationWidget(),
    "GrowTransitionWidget": GrowTransitionWidget(),
    "RouteTransitionWidget": RouteTransitionWidget(),
    "HeroAnimationWidget": HeroAnimationWidget(),
    "StaggerAnimationWidget": StaggerAnimationWidget(),
    "ComposeWidget": ComposeWidget(),
    "TurnBoxWidget": TurnBoxWidget(),
    "GobangWidget": GobangWidget(),
    "ProgressBarWidget": ProgressBarWidget(),
    "文件读写": FileDemoWidget(),
    "SharedPreferences读写": SPDemoWidget(),
    "HttpClient例子": HttpClientDemoWidget(),
    "Dio例子": DioDemoWidget(),
    "WebSocket例子": WebSocketWidget(),
    "Socket例子": SocketDemoWidget(),
  };

  final _divider = Divider(color: Colors.white,height: 3,);

  @override
  void initState() {
//    Locale locale = Localizations.localeOf(context);
//    debugPrint("${locale.languageCode}-${locale.countryCode}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBackUtils.createDoubleBackWidget(createScaffold(
        "LauncherList",
        ListView.separated(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            reverse: false,
            itemBuilder: (BuildContext context, int index) {
              final key = _map.keys.elementAt(index);
              return Container(
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(
                      key,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        return _map[key];
                      }));
                    },
                  ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return _divider;
            },
            itemCount: _map.length)));
  }
}
