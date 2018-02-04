part of routes;

class HomeIndexRoute extends StatelessWidget {
  static const String routeName = '/';

  const HomeIndexRoute({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      drawer: new StoreConnector(
        converter: (Store<AppState> store) => store.state.routesState.homeIndex.hamburger,
        builder: _buildHamburger,
      ),
    );
  }

  Widget _buildHamburger(BuildContext context, HamburgerModel hamburger) {
    return new HamburgerMenu(
      user: hamburger.user,
      notifications: hamburger.notifications,
      onPressed: (String routeName) {
        Navigator.of(context).pushNamed(routeName);
      }
    );
  }

  Widget _buildAppBar() {
    return new AppBar(
      title: new StoreConnector(
        converter: (Store<AppState> store) => store.state.routesState.homeIndex.title,
        builder: (BuildContext context, title) => new Text(title),
      ),
      actions: <Widget>[
        new IconButton(
          icon: const Icon(Icons.search),
          onPressed:  () {},
        )
      ],
    );
  }
}