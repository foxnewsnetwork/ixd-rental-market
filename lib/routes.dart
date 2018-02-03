library routes;
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './widgets.dart';
import './data.dart';
import './reducers.dart';

part './routes/debug/hamburger.dart';
part './routes/debug/icons.dart';
part './routes/debug/index.dart';
part './routes/debug/list-view.dart';

part './routes/home/index.dart';

part './routes/listing/detail.dart';

class AppRouter {
  final Router router = new Router();
  final Store<AppState> store = new Store(appReducer, initialState: AppState.initial);

  static AppRouter _instance;

  factory AppRouter() { 
    if (_instance != null) {
      return _instance;
    }
    _instance = new AppRouter._();
    return _instance;
  }

  AppRouter._() {
    router.define(
      '/',
      handler: new Handler(
        type: HandlerType.route,
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new StoreProvider(
            store: store,
            child: new StoreConnector(
              converter: (Store<AppState> store) => store.state.routesState.homeIndex,
              builder: (BuildContext context, HomeIndexRouteState state) => new HomeIndexRoute(state: state),
            )
          );
        }
      )
    );
    router.define(
      'debug/hamburger',
      handler:  new Handler(
        type: HandlerType.route,
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new DebugHamburgerRoute();
        }
      )
    );
    router.define(
      '/debug', 
      handler: new Handler(
        type: HandlerType.route, 
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          
          return new DebugIndexRoute(title: 'debug room');
        }
      )
    );
    router.define(
      '/debug/list-view',
      handler: new Handler(
        type: HandlerType.route,
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new DebugListViewRoute(title: 'debug list view');
        }
      )
    );
    router.define(
      '/listing/:id/detail',
      handler: new Handler(
        type: HandlerType.route,
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          String title = params['id'];

          return new ListingDetailRoute(
            title: '$title - 4200 Horsepower Bobcat',
            dailyPriceRate: 420.0,
            distanceAway: 0.5,
          );
        }
      )
    );
  }

  Route<Null> generator(RouteSettings routeSettings) => router.generator(routeSettings);
}