part of data;

@immutable
class HomeIndexRouteState {
  final String title;
  final HamburgerModel hamburger;
  final List<TagModel> tags;

  const HomeIndexRouteState({
    this.title: 'Rental Market',
    this.hamburger: HamburgerModel.initial,
    this.tags: const <TagModel>[
      const TagModel(displayName: 'Top Categories'),
      const TagModel(displayName: 'Nearby')
    ]
  });

  static const initial = const HomeIndexRouteState();
}
