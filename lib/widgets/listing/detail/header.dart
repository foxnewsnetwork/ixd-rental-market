import 'package:flutter/material.dart';

String _formatPrice(double priceRate) {
  return '\$$priceRate / day';
}

String _formatDistance(double distanceAway) {
  return '$distanceAway mi';
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
              new Text('Available Now')
            ],
          )
        ]
      )
    ],
  );
}  