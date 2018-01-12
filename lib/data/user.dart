import 'package:flutter/material.dart';

class User {
  final String avatarImageURL;
  final String fullName;
  final String initials;
  final num listingCount;

  const User({
    this.avatarImageURL,
    this.fullName,
    this.initials: 'AU',
    this.listingCount: 0
  });

  ImageProvider<dynamic> get imageProvider => avatarImageURL != null ? new NetworkImage(avatarImageURL) : new AssetImage('images/dogelog.jpg');
}