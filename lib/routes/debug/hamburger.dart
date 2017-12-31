import 'package:flutter/material.dart';
import 'package:ixd_rental_market/widgets/hamburger-menu.dart';
import 'package:ixd_rental_market/data/user.dart';

class DebugHamburger extends StatelessWidget {

  DebugHamburger({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hamburger Menu Debug'),
      ),
      body: new Container(
        width: 275.0,
        child: new HamburgerMenu(
          user: new User(
            fullName: 'Doge McMasters'
          ),
          onPressed: (String routeName) { },
        )
      )
    );
  }
}