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
      appBar: buildAppBar(),
      drawer: new HamburgerMenu(
        user: userFixture,
        notifications: 2,
        onPressed: (String routeName) {
          Navigator.of(context).pushNamed(routeName);
        }
      ),
    );
  }

  Widget buildAppBar() {
    return new AppBar(
      title: new Text(title),
      actions: <Widget>[
        new IconButton(
          icon: const Icon(Icons.search),
          onPressed:  () {},
        )
      ],
    );
  }
}