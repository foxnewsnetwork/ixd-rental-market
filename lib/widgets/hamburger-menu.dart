import 'package:flutter/material.dart';
import 'package:ixd_rental_market/data/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Similar to a void callback, except used exclusively
/// for affecting transitions between routes and thus
/// changing route state. 
/// 
/// API currently still in flux!
typedef void LinkCallback(String routeName);

class HamburgerMenu extends StatelessWidget {
  final User user;
  final LinkCallback onPressed;

  HamburgerMenu({ 
    Key key,
    this.user,
    this.onPressed
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.black12
      ),
      child: _buildCore()
    );
  }

  Widget _buildCore() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new _HamburgerHeader(
          imageProvider: user.imageProvider,
          header: user.fullName,
          subheader: 'My Menu',
          onPressed: () {
            return onPressed('user.whatever');
          },
        ),
        new _HamburgerSection(
          children: <Widget>[
            new _HamburgerLink(
              icon: Icons.email,
              linkName: 'Notifications',
              notification: new _HamburgerNotification.danger(
                message: '4'
              ),
              onPressed: () {
                return onPressed('whatever');
              },
            ),
            new _HamburgerLink(
              icon: FontAwesomeIcons.edit,
              linkName: 'Compose new listing',
              onPressed: () {
                return onPressed('whatever');
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _HamburgerHeader extends StatelessWidget {
  final ImageProvider<dynamic> imageProvider;
  final String header;
  final String subheader;
  final VoidCallback onPressed;

  _HamburgerHeader({
    Key key,
    this.imageProvider,
    this.header,
    this.subheader,
    this.onPressed
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) { 
    return new Container(
      decoration: new BoxDecoration(
        border: new Border(
          top: const BorderSide(
            color: Colors.black38
          ),
          bottom: const BorderSide(
            color: Colors.black38
          ),
        )
      ),
      height: 68.0,
      child: new FlatButton(
        onPressed: onPressed,
        color: Colors.transparent,
        child: _buildCore(),
      ),
    );
  }
  
  Widget _buildCore() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildLeft(),
        _buildRight()
      ],
    );
  }

  Widget _buildLeft() {
    return new Row(
      children: <Widget>[
        _buildAvatar(),
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeaderText(),
            _buildSubText()
          ],
        )
      ],
    );
  }

  Widget _buildAvatar() {
    return new Container(
      width: 24.0,
      height: 24.0,
      margin: new EdgeInsets.only(right: 15.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(12.0),
        image: new DecorationImage(
          // @TODO: repalce with actual image
          image: imageProvider,
          fit: BoxFit.fill
        )
      ),
    );
  }

  Widget _buildHeaderText() {
    return new Text(
      header, 
      style: new TextStyle(
        fontSize: 14.0,
        color: Colors.black
      )
    );
  }

  Widget _buildSubText() {
    return new Text(
      subheader,
      style: new TextStyle(
        fontSize: 12.0,
        color: Colors.black87
      )
    );
  }

  Widget _buildRight() {
    return new Container(
      child: new Icon(
        Icons.chevron_right
      ),
      margin: new EdgeInsets.only(right: 2.0),
    );
  }
}

class _HamburgerSection extends StatelessWidget {
  final List<Widget> children;
  final Color bgColor;

  _HamburgerSection({
    Key key,
    this.children: const <Widget>[],
    this.bgColor: Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: bgColor,
      child: new Column(
        children: children,
      )
    );
  }
}

class _HamburgerLink extends StatelessWidget {
  final IconData icon;
  final String linkName;
  final _HamburgerNotification notification;
  final VoidCallback onPressed;

  _HamburgerLink({
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

enum NotificationSeverity {
  danger,
  warning,
  success,
  info,
  invisible
}
class _HamburgerNotification extends StatelessWidget {
  final NotificationSeverity severity;
  final String message;
  final Color backColor;
  final Color textColor;

  _HamburgerNotification.danger({
    Key key,
    this.message: ''
  }) 
  : backColor = Colors.red,
    textColor = Colors.white,
    severity = NotificationSeverity.danger,
    super(key: key);

  _HamburgerNotification.warning({
    Key key,
    this.message: ''
  }) 
  : backColor = Colors.yellow,
    textColor = Colors.white,
    severity = NotificationSeverity.warning,
    super(key: key);

  _HamburgerNotification.success({
    Key key,
    this.message: ''
  }) 
  : backColor = Colors.green,
    textColor = Colors.white,
    severity = NotificationSeverity.success,
    super(key: key);

  _HamburgerNotification.info({
    Key key,
    this.message: ''
  }) 
  : backColor = Colors.blue,
    textColor = Colors.white,
    severity = NotificationSeverity.info,
    super(key: key);

  _HamburgerNotification.invisible({
    Key key,
    this.message: ''
  }) 
  : backColor = Colors.transparent,
    textColor = Colors.transparent,
    severity = NotificationSeverity.invisible,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 20.0,
      height: 20.0,
      margin: new EdgeInsets.only(right: 7.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        color: backColor
      ),
      child: new Center(
        child: _buildText(),
      )
    );
  }

  Widget _buildText() {
    return new Text(
      message,
      style: new TextStyle(
        fontSize: 12.0,
        color: textColor
      ),
    );
  }
}