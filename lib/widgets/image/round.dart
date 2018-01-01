import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  final double radius;
  final EdgeInsets margin;
  final ImageProvider<dynamic> imageProvider;

  double get width => radius * 2;
  double get height => width;

  const RoundImage({
    Key key,
    this.radius: 12.0,
    this.margin,
    @required this.imageProvider
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: height,
      margin: margin,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(radius),
        image: new DecorationImage(
          image: imageProvider,
          fit: BoxFit.fill
        )
      ),
    );
  }
}