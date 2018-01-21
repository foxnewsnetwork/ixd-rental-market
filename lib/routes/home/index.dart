part of routes;

class HomeIndexRoute extends StatelessWidget {
  final String title;

  HomeIndexRoute({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.more_vert),
            tooltip: 'Side menu',
            onPressed: () {},
          )
        ]
      ),
      drawer: new HamburgerMenu(
        user: userFixture,
        notifications: 2,
        onPressed: (String routeName) {
          Navigator.of(context).pushNamed(routeName);
        }
      ),
    );
  }
}