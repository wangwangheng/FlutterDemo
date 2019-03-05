import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'LauncherListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.blue,
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.blue,
      ),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale("zh","CN"),
      const Locale("en","US"),
    ],
    home: LauncherListPage(),
    );
  }
}
