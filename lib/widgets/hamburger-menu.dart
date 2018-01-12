import 'package:flutter/material.dart';
import 'package:ixd_rental_market/data/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './hamburger-menu/section.dart';
import './hamburger-menu/link.dart';
import './hamburger-menu/notification.dart';

/// Similar to a void callback, except used exclusively
/// for affecting transitions between routes and thus
/// changing route state. 
/// 
/// API currently still in flux!
typedef void LinkCallback(String routeName);

class HamburgerMenu extends StatelessWidget {
  final User user;
  final LinkCallback onPressed;
  final int notifications;

  const HamburgerMenu({ 
    Key key,
    this.user,
    this.onPressed,
    this.notifications: 0
  }): super(key: key);


  HamburgerMenuNotification get hamburgerMenuNotification => 
    new HamburgerMenuNotification.danger(message: notifications.toString());

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          _buildHeader(),
          _buildBlackSection()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return new UserAccountsDrawerHeader(
      accountName: new Text(user.fullName),
      accountEmail: new Text('my-email@somewhere.co'),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: user.imageProvider,
        child: new Text(user.initials)
      ),
      onDetailsPressed: () {
        return onPressed('user.whatever');
      },
    );
  }

  Widget _buildBlackSection() {
    return new HamburgerMenuSection(
      bgColor: Colors.transparent,
      borderColor: Colors.transparent,
      children: <Widget>[
        _buildNotificationLink(),
        new HamburgerMenuLink(
          icon: FontAwesomeIcons.edit,
          linkName: 'Compose new listing',
          onPressed: () {
            return onPressed('whatever');
          },
        ),
        new HamburgerMenuLink(
          icon: Icons.star_border,
          linkName: 'My reviews',
          onPressed: () { 
            return onPressed('reviews');
          },
        ),
        new HamburgerMenuLink(
          icon: Icons.folder_open,
          linkName: 'Wallet',
          onPressed: () { 
            return onPressed('wallet');
          },
        ),
        new HamburgerMenuLink(
          icon: Icons.description,
          linkName: 'Transaction history',
          onPressed: () { 
            return onPressed('Transaction history');
          },
        ),
        new HamburgerMenuLink(
          icon: FontAwesomeIcons.bolt,
          linkName: 'Disputes',
          onPressed: () { 
            return onPressed('Disputes');
          },
        ),
        new HamburgerMenuLink(
          icon: FontAwesomeIcons.gavel,
          linkName: 'Terms of service',
          onPressed: () { 
            return onPressed('Terms of service');
          },
        ),
      ],
    );
  }

  Widget _buildNotificationLink() {
    if (notifications > 0) {
      return new HamburgerMenuLink(
        icon: Icons.email,
        linkName: 'Notifications',
        notification: hamburgerMenuNotification,
        onPressed: () {
          return onPressed('Notifications');
        },
      );
    } else {
      return new HamburgerMenuLink(
        icon: Icons.email,
        linkName: 'Notifications',
        onPressed: () {
          return onPressed('Notifications');
        },
      );
    }
  }
}