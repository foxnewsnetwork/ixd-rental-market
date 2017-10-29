import 'package:flutter/material.dart';

class DebugRoute extends StatefulWidget {
  DebugRoute({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _DebugRouteState createState() => new _DebugRouteState();
}

class _DebugRouteState extends State<DebugRoute> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        /**
         * Remember, `widget` is implicitly `this.widget`
         * this is apparently run-of-the-mill dart syntax
         */
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            new Text(
              'Welcome to the debug page!',
            ),
            new Image.asset('images/dogelog.jpg')
          ],
        ),
      ),
    );
  }
}