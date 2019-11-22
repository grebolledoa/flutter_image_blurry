import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:image_blurry/image_blurry.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await ImageBlurry.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    /*
    try {
      if (await ImageBlurry.isImageBlurry('https://www.allaboutvision.com/static/dca7ac0b2b77f938717971d612fe658d/18f60/visually-impaired-1200x630.png')) {
        platformVersion += ' Imagen Borrosa';
      } else {
        platformVersion += ' Imagen buena';
      }
    } on Exception catch(e){
      platformVersion = e.toString();
    }
    */

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
