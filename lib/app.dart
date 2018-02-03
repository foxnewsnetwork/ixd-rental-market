import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './routes.dart';
import './data.dart';
import './reducers.dart';

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final Router router = new Router();
  final Store<AppState> store = new Store(appReduce, initialState: AppState.initial);

  _MyAppState() {
    Routes.setup(this.router);
    debugPrint('0000000');
    debugPrint('Setting up state');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Rental Market',
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
      home: new StoreConnector(
        converter: (Store<AppState> store) => store.state.routesState.homeIndex,
        builder: (BuildContext context, HomeIndexRouteState homeIndex) => new HomeIndexRoute(state: homeIndex),
      ),

      onGenerateRoute: this.router.generator,
    );
  }
}