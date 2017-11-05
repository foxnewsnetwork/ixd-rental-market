import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DebugRoute extends StatefulWidget {
  DebugRoute({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _DebugRouteState createState() => new _DebugRouteState();
}

String toString(IconData icon) {
  return new String.fromCharCode(icon.hashCode);
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
              'Welcome to the debug page!'
            ),
            new Text(
              toString(Icons.accessible) + toString(Icons.access_time),
              textAlign: TextAlign.center,
              style: new TextStyle(
                inherit: false,
                fontFamily: "MaterialIcons",
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 24.0,
              ),
            ),
            new IconButton(
              icon: new Icon(FontAwesomeIcons.android),
              tooltip: 'Font awesome Icon Yay',
              onPressed: () { print('Pressed icon'); },
            ),
            new Image.asset('images/dogelog.jpg')
          ],
        ),
      ),
    );
  }
}