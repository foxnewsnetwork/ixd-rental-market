import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ixd_rental_market/utils/icon.dart';

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

class HeaderAPI {
  final String title;
  final double dailyPriceRate;
  final double distanceAway;

  const HeaderAPI({
    this.title,
    this.dailyPriceRate,
    this.distanceAway
  });
}

Widget header(HeaderAPI api) {
  return new Container(
    constraints: new BoxConstraints.expand(
      height: 100.0
    ),
    decoration: _button90s,
    padding: const EdgeInsets.all(10.0),
    child: _headerCore(api)
  ); 
}

Widget _headerCore(HeaderAPI api) {
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
            api.title,
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
              new Text(_formatPrice(api.dailyPriceRate)),
              new Text(_formatDistance(api.distanceAway))
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