part of data;

class HamburgerModel {
  final User user;
  final int notifications;

  const HamburgerModel({
    this.user: User.initial,
    this.notifications: 0
  });

  static const initial = const HamburgerModel();
}