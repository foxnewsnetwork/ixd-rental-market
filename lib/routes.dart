library routes;
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ixd_rental_market/widgets.dart';
import 'package:ixd_rental_market/data.dart';
import 'package:ixd_rental_market/fixtures.dart';

part './routes/debug/hamburger.dart';
part './routes/debug/icons.dart';
part './routes/debug/index.dart';
part './routes/debug/list-view.dart';

part './routes/home/index.dart';

part './routes/listing/detail.dart';

abstract class Routes {
  static Router router;

  static void setup(Router router) {
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
    Routes.router = router;
  }
}