import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './routes.dart';

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final Router router = new Router();

  _MyAppState() {
    Routes.setup(this.router);
    debugPrint('0000000');
    debugPrint('Setting up state');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Hot Reload App in IntelliJ). Notice that the counter
        // didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new HomeIndexRoute(title: 'Rental Market'),

      onGenerateRoute: this.router.generator,
    );
  }
}