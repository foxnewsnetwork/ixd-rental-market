# Material Drawers

While retackling my drawer integration, I came across flutter's material app's [native drawer implementation])https://docs.flutter.io/flutter/material/Drawer-class.html). I had previously already written my own shitty implementation of a drawer, but now that I've discovered the proper way, it's time to go back through it and learn how to do it right.

## DrawerHeader

`DrawerHeader`s are used to display the user related info, this functionality is apparently common enough such that flutter ships with a direct [UserAccountsDrawerHeader](https://docs.flutter.io/flutter/material/UserAccountsDrawerHeader-class.html)

![](./ch13/drawer-header.png)

`DrawerHeader`s requires an user name, email, and commonly an avatar picture as per material design; here is my usage:

```dart
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
```

By using flutter's `UserAccountsDrawerHeader` I can now safely delete my own implementation of the hamburger menu header

### CircleAvatar

Apparently, the use of the round avatar is so common that flutter ships with this feature out of the box via [the circle-avatar](https://docs.flutter.io/flutter/material/CircleAvatar-class.html). Typically, material designs recommends that we provide the user's initials in addition to the typical picture

## Material Hamburger Menu

Apparently, material designs wants to put the hamburger menu on the upper left corner. I don't particularly care either way, but this does mean I will need to change my design. Nevertheless, this does beg the question of how do we go back in apps in iOS. I will have to do some research.

[Read more about the navigation specs here](https://material.io/guidelines/patterns/navigation-drawer.html#navigation-drawer-specs).

## ListTile

In flutter, drawer menu options (especially when implemented inside a ListView) are best implemented by the cannonical `ListTile` as per [docs here](https://docs.flutter.io/flutter/material/ListTile-class.html). In anycase, I should switch over my current `FlatButton` implementation to using the `ListTile` to be on the correct side of history

Note that flutter ships with different flavors of the `ListTile` such as:

- AboutListTile
- CheckboxListTile
- RadioListTile
- SwitchListTile

I will investigate what they all do later on

## Divider and SubHeaders

The material drawer specs affords for [dividers](https://docs.flutter.io/flutter/material/Divider-class.html) and subsections, I need to figure out how to do them correctly in flutter

## Notification

How do I show notifications to the user? Having switched to using the `ListTile` shipped from flutter, this is now an open question