import 'package:flutter/material.dart';
import 'package:ixd_rental_market/widgets/listing/detail/header.dart' as ListingDetailHeader;
import 'package:ixd_rental_market/widgets/listing/detail/horizontal-nav.dart';
import 'package:ixd_rental_market/widgets/listing/detail/gallery-preview.dart';
import 'package:ixd_rental_market/widgets/listing/detail/address-map-button.dart';
import 'package:ixd_rental_market/widgets/listing/detail/tags-gallery.dart';
import 'package:ixd_rental_market/widgets/listing/detail/user-blurb.dart';
import 'package:ixd_rental_market/widgets/listing/detail/product-description.dart';
import 'package:ixd_rental_market/widgets/hamburger-menu.dart';
import 'package:ixd_rental_market/data/tag.dart';
import 'package:ixd_rental_market/data/user.dart';

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

const _userFixture = const User(
  fullName: 'Doge McMaster'
);

class _ListingDetailRouteState extends State<ListingDetailRoute> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.more_vert),
            tooltip: 'Side menu',
            onPressed: () {},
          )
        ],
      ),
      drawer: new HamburgerMenu(
        user: _userFixture,
        onPressed: (String routeName) { }
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
          ),
          new AddressMapButton(
            address: '1806 Munson Street, Camarillo, CA 93010',
            onPressed: () {},
          ),
          new GalleryPreview(
            seeAllPressed: doNothing,
            imageURIs: <String>[
              'images/dogelog.jpg',
              'images/dogelog.jpg',
              'images/dogelog.jpg',
              'images/dogelog.jpg'
            ],
          ),
          new TagsGallery(
            onPressed: doNothing,
            tags: <Tag>[
              new Tag(displayName: 'doge'),
              new Tag(displayName: 'corgi'),
              new Tag(displayName: 'husky'),
              new Tag(displayName: 'malamute'),
              new Tag(displayName: 'burmease'),
              new Tag(displayName: 'wolf'),
              new Tag(displayName: 'purse dog')
            ]
          ),
          new UserBlurb(
            onPressed: doNothing,
            user: _userFixture,
          ),
          new ProductDescription(
            description: 'Lorem ipsum dolor sit amet, solet melius et ius. Cu vim nisl omnesque. Vix ut latine molestie. In nec tollit liberavisse, movet insolens pro at. Facer salutandi percipitur usu ea.',
          )
        ],
      )
    );
  }
}
