import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:is_passcode_enabled/is_passcode_enabled.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _lockScreenAvailable = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool lockScreenAvailable;
    if (Platform.isIOS) {
      try {
        lockScreenAvailable = await IsPasscodeEnabled.isPasscodeEnabled;
      } on PlatformException {
        lockScreenAvailable = false;
      }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;
    } else {
      _lockScreenAvailable = false;
    }
    setState(() {
      _lockScreenAvailable = lockScreenAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lockscreen Experiment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(child: Text('The lockscreen is available: $_lockScreenAvailable')),
      ),
    );
  }
}
