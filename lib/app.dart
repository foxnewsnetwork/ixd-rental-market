import 'package:flutter/material.dart';
import './routes/home.dart';
import './routes/debug.dart';
import './routes/listing/detail.dart';

class MyApp extends StatelessWidget {
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
      home: new MyHomePage(title: 'Flutter Demo Home Page'),

      routes: <String, WidgetBuilder> {
        '/debug': (BuildContext context) => new DebugRoute(title: 'Debug Route'),
        '/listing/detail': (BuildContext context) => 
          new ListingDetailRoute(
            title: '4200 Horsepower Bobcat',
            dailyPriceRate: 420.0,
            distanceAway: 0.5,
          )
      },
    );
  }
}

