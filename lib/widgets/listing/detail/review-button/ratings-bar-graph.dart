import 'package:flutter/material.dart';
import 'package:ixd_rental_market/data/review-aggregate.dart';
import './rating-stars.dart';
import './rating-bars.dart';

class RatingsBarGraph extends StatelessWidget {
  final ReviewAggregate reviewAggregate;

  RatingsBarGraph({
    Key key,
    this.reviewAggregate
  }) : super(key: key);

  String get starsRounded => reviewAggregate.stars.toStringAsFixed(1);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(right: 20.0),
      child: _buildCore(),
    );
  }

  Widget _buildCore() {
    return new Row(
      children: <Widget>[
        new Text(
          starsRounded,
          style: const TextStyle(
            fontSize: 36.0
          ),  
        ),
        new RatingStars(
          stars: reviewAggregate.stars, 
          transactions: reviewAggregate.transactions
        ),
        new RatingBars(bars: reviewAggregate.bars)
      ],
    );
  }
}