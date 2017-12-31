import 'package:flutter/material.dart';
import './notification.dart';

class HamburgerMenuLink extends StatelessWidget {
  final IconData icon;
  final String linkName;
  final HamburgerMenuNotification notification;
  final VoidCallback onPressed;

  HamburgerMenuLink({
    Key key,
    this.icon,
    this.linkName,
    this.notification,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 48.0,
      child: new FlatButton(
        onPressed: onPressed,
        color: Colors.transparent,
        child: _buildCore(),
      )
    );
  }

  Widget _buildCore() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Row(
          children: <Widget>[
            _buildIcon(),
            _buildText(),
          ],
        ),
        notification ?? new Container()
      ],
    );
  }

  Widget _buildText() {
    return new Container(
      child: new Text(
        linkName,
        style: const TextStyle(
          color: Colors.blue
        )
      ),
      margin: new EdgeInsets.only(left: 15.0),
    );
  }

  Widget _buildIcon() {
    return new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 12.0
      ),
      child: new Icon(
        icon,
        size: 24.0,
        color: Colors.blue,
      )
    );
  }
}