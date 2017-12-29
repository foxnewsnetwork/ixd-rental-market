import 'package:flutter/material.dart';

class User {
  final String avatarImageURL;
  final String fullName;

  User({
    this.avatarImageURL,
    this.fullName
  });

  ImageProvider<dynamic> get imageProvider => avatarImageURL != null ? new NetworkImage(avatarImageURL) : new AssetImage('images/dogelog.jpg');
}