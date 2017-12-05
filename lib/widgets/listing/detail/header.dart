import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String _formatPrice(double priceRate) {
  return '\$$priceRate / day';
}

String _formatDistance(double distanceAway) {
  return '$distanceAway mi';
}

String toString(IconData icon) {
  return new String.fromCharCode(icon.hashCode);
}

const BoxDecoration _button90s = const BoxDecoration(
  border: const Border(
    top: const BorderSide(width: 1.0, color: const Color(0xFFFFFFFFFF)),
    left: const BorderSide(width: 1.0, color: const Color(0xFFFFFFFFFF)),
    right: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
    bottom: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
  ),
  color: const Color(0xECE6E6FF)
);

Widget header(widget) {
  return new Container(
    constraints: new BoxConstraints.expand(
      height: 100.0
    ),
    decoration: _button90s,
    padding: const EdgeInsets.all(10.0),
    child: _headerCore(widget)
  ); 
}

Widget _headerCore(widget) {
  Text greenIconText = new Text(
    toString(FontAwesomeIcons.circleO),
    style: new TextStyle(
      color: Colors.green,
      fontStyle: FontStyle.normal,
      fontSize: 18.0, 
      fontFamily: "FontAwesome"
    )
  );
  return new Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      new Row(
        children: <Widget>[
          new Text(
            widget.title,
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
      new Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[  
              new Text(_formatPrice(widget.dailyPriceRate)),
              new Text(_formatDistance(widget.distanceAway))
            ],
          ),
          new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  greenIconText,
                  new Text('Available Now')
                ],
              )
            ],
          )
        ]
      )
    ],
  );
}  