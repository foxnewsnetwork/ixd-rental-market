import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './routes/debug.dart';
import './routes/debug/list-view.dart';
import './routes/listing/detail.dart';
import './routes/debug/hamburger.dart';

class Routes {
  static Router router;

  static void setup(Router router) {
    router.define(
      'debug/hamburger',
      handler:  new Handler(
        type: HandlerType.route,
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new DebugHamburger();
        }
      )
    );
    router.define(
      '/debug', 
      handler: new Handler(
        type: HandlerType.route, 
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          
          return new DebugRoute(title: 'debug room');
        }
      )
    );
    router.define(
      '/debug/list-view',
      handler: new Handler(
        type: HandlerType.route,
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new DebugListView(title: 'debug list view');
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
    Routes.router = router;
  }
}