import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(),
      home: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            // this prevents the app to pop on its own ensuring the app
            // stays open
            return false;
          },
          child: Container(), // TODO change to navigator
        ),
      ),
    );
  }
}
