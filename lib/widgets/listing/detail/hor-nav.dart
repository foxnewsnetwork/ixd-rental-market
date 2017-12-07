import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ixd_rental_market/utils/icon.dart';


class HorNavAPI {
  final VoidCallback sharePressed;
  final VoidCallback bookmarkPressed;
  final VoidCallback rentPressed;

  const HorNavAPI({
    this.sharePressed,
    this.bookmarkPressed,
    this.rentPressed
  }) : super();
}

Widget horNav(HorNavAPI api) {
  return new ButtonBar(
    alignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      new FlatButton(
        onPressed: api.sharePressed,
        child: new Column(
          children: <Widget>[
            new Text(
              toString(FontAwesomeIcons.circleO),
              style: new TextStyle(
                fontFamily: 'FontAwesome'
              ),
            ),
            new Text('Share')
          ],
        ),
      ),
      new FlatButton(
        onPressed: api.bookmarkPressed,
        child: new Column(
          children: <Widget>[
            new Text(
              toString(FontAwesomeIcons.circleO),
              style: new TextStyle(
                fontFamily: 'FontAwesome'
              ),
            ),
            new Text('Bookmark')
          ],
        )
      ),
      new FlatButton(
        onPressed: api.rentPressed,
        child: new Column(
          children: <Widget>[
            new Text(
              toString(FontAwesomeIcons.circleO),
              style: new TextStyle(
                fontFamily: 'FontAwesome'
              ),
            ),
            new Text('Rent')
          ],
        )
      )
    ],
  );
}