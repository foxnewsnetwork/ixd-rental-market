part of data;

@immutable
class RoutesState {
  final HomeIndexRouteState homeIndex;
  const RoutesState({
    this.homeIndex: HomeIndexRouteState.initial
  });

  static const initial = const RoutesState();
}

