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