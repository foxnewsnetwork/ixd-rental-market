# Redux Integration

Here, I roll in the redux and flutter_redux frameworks in order to achieve proper modern web standard compliant data integration with facebok's redux framework

## Type Problem

![](./type-problem.png)

You run into this problem when you cross import the same libraries as in: https://github.com/dart-lang/sdk/issues/14353

Apparently, twice importing the same libraries results in bad issues, so I will try experimenting with moving my libraries around all into routes in order to fix.

Notably, `dart` sees a difference between:

`import './data.dart'` and import `import 'package:data/data.dart` so be aware of this!

## Factory Constructors

```dart
factory AppRouter() { 
    if (_instance != null) {
      return _instance;
    }
    _instance = new AppRouter._();
    return _instance;
  }

  AppRouter._() {
    _instance.draw();
  }
```