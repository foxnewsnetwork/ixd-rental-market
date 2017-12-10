import 'package:flutter/material.dart';
import 'package:ixd_rental_market/widgets/listing/detail/header.dart' as ListingDetailHeader;
import 'package:ixd_rental_market/widgets/listing/detail/horizontal-nav.dart';

class ListingDetailRoute extends StatefulWidget {
  ListingDetailRoute({Key key, this.title, this.dailyPriceRate, this.distanceAway}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final double dailyPriceRate;
  final double distanceAway;

  @override
  _ListingDetailRouteState createState() => new _ListingDetailRouteState();
}

void doNothing() {
  return;
}

class _ListingDetailRouteState extends State<ListingDetailRoute> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          ListingDetailHeader.header(
            new ListingDetailHeader.HeaderAPI(
              title: widget.title,
              dailyPriceRate: widget.dailyPriceRate,
              distanceAway: widget.distanceAway
            )
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: new HorizontalNav(
              sharePressed: doNothing,
              bookmarkPressed: doNothing,
              rentPressed: doNothing
            )
          )
        ],
      )
    );
  }
}
