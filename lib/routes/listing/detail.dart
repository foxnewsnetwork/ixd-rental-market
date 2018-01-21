part of routes;

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
      body: new ListView(
        children: <Widget>[
          new DetailHeader(
            title: widget.title,
            dailyPriceRate: widget.dailyPriceRate,
            distanceAway: widget.distanceAway
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
          ),
          new ReviewButton(
            onTap: () {},
            reviewAggregate: new ReviewAggregate(
              disputes: 33,
              transactions: 99,
              bars: <Bar>[
                const Bar.five(amount: 666),
                const Bar.four(amount: 123),
                const Bar.three(amount: 44),
                const Bar.two(amount: 12),
                const Bar.one(amount: 24),
                const Bar.zero(amount: 26)
              ]
            ),
          )
        ],
      )
    );
  }
}
