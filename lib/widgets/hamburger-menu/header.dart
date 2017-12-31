import 'package:flutter/material.dart';

class HamburgerMenuHeader extends StatelessWidget {
  final ImageProvider<dynamic> imageProvider;
  final String header;
  final String subheader;
  final VoidCallback onPressed;

  HamburgerMenuHeader({
    Key key,
    this.imageProvider,
    this.header,
    this.subheader,
    this.onPressed
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) { 
    return new Container(
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