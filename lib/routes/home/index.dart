part of routes;

class HomeIndexRoute extends StatelessWidget {
  final HomeIndexRouteState state;

  HomeIndexRoute({
    Key key,
    this.state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(),
      drawer: new HamburgerMenu(
        user: state.hamburger.user,
        notifications: state.hamburger.notifications,
        onPressed: (String routeName) {
          Navigator.of(context).pushNamed(routeName);
        }
      ),
    );
  }

  Widget buildAppBar() {
    return new AppBar(
      title: new Text(state.title),
      actions: <Widget>[
        new IconButton(
          icon: const Icon(Icons.search),
          onPressed:  () {},
        )
      ],
    );
  }
}