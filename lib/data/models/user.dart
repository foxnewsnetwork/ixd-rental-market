part of data;

@immutable
class User {
  final String avatarImageURL;
  final String fullName;
  final String initials;
  final num listingCount;

  const User({
    this.avatarImageURL: 'images/dogelog.jpg',
    this.fullName: 'Doge Peterson',
    this.initials: 'AU',
    this.listingCount: 0
  });

  ImageProvider<dynamic> get imageProvider => new NetworkImage(avatarImageURL);

  static const initial = const User();
}