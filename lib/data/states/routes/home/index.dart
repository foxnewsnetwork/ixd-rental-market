part of data;

@immutable
class HomeIndexRouteState {
  final String title;
  final HamburgerModel hamburger; 

  const HomeIndexRouteState({
    this.title: 'Rental Market',
    this.hamburger: HamburgerModel.initial
  });

  static const initial = const HomeIndexRouteState();
}
