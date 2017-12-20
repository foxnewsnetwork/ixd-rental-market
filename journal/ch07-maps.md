# Maps

Here, we go over how to get maps to show up in flutter.

For now, I will use the [google maps library](https://github.com/apptreesoftware/flutter_google_map_view)

![](https://github.com/apptreesoftware/flutter_google_map_view/raw/master/example/Android_screen.png)

For now, I will the following API key as my test api key (obviously, this isn't going to be my production/staging key):

```
AIzaSyCmuQFT7s1KguoHkddQtnnAO8lkPCAxgH4
```

## Setup

Following with the instructions, I must first configure my `Info.plist` on iOS. Notably, I must set `NSLocationWhenInUseUsageDescription`

### iOS Permission
`NSLocationWhenInUseUsageDescription` is a xml key-string pair I must set in `Info.plist`
This is apparently a description of why my app requires location access. I added the following:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>To access maps, meet-up, and location services</string>
```

I also must take note that, on iOS, I must perform `MapView.setApiKey` with my given apiKey before I can use the map

### Android Permission
On the android, I must make permission modification changes in the `AndroidManifest.xml` file, and `build.gradle` files with the required permissions, keys, and dependencies

# Activities and Fragments
Maps represent a hard problem because it's implemeneted slightly different on android versus iOS, furthermore, it is implemented natively using Java or Swift. This means, in order to properly interface with it, I must learn about [activities and fragments and how they play with flutter](https://flutter.io/flutter-for-android/#what-are-the-equivalent-of-activities-and-fragments)

For reference sakes, the [flutter packages of dart pub live here](https://pub.dartlang.org/flutter/packages/)

Also, it seems flutter will one day support proper [map views in stateless apps](https://github.com/flutter/flutter/issues/73)