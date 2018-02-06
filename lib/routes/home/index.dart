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
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.add),
        tooltip: 'Create a Listing',
      ),
      body: new ListView(
        children: <Widget>[
          _connectChipRow()
        ],
      ),
    );
  }

  Widget _connectChipRow() {
    return new StoreConnector(
      converter: (Store<AppState> store) => 
        store.state.routesState.homeIndex.tags,
      builder: (BuildContext context, List<TagModel> tags) => 
        new HomeIndexChipRow(
          children: tags.map((TagModel tag) => 
            new HomeIndexChip(
              label: new Text(tag.displayName),
              onTap: () {
              }
            )
          ).toList(),
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