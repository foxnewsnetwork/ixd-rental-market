import 'package:flutter/material.dart';

class User {
  final String avatarImageURL;
  final String fullName;
  final num listingCount;

  const User({
    this.avatarImageURL,
    this.fullName,
    this.listingCount: 0
  });

  ImageProvider<dynamic> get imageProvider => avatarImageURL != null ? new NetworkImage(avatarImageURL) : new AssetImage('images/dogelog.jpg');
}