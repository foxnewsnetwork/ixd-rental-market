import 'package:meta/meta.dart';

class Bar {
  final int weight;
  final int amount;

  const Bar({
    @required this.weight,
    @required this.amount
  });

  const Bar.zero({
    num amount: 0
  }) : this(amount: amount, weight: 0);

  const Bar.one({
    num amount: 0
  }) : this(amount: amount, weight: 1);

  const Bar.two({
    num amount: 0
  }) : this(amount: amount, weight: 2);

  const Bar.three({
    num amount: 0
  }) : this(amount: amount, weight: 3);

  const Bar.four({
    num amount: 0
  }) : this(amount: amount, weight: 4);

  const Bar.five({
    num amount: 0
  }) : this(amount: amount, weight: 5);

  num get value => amount * weight;
}

class ReviewAggregate {
  final int transactions;
  final int disputes;
  final List<Bar> bars;

  const ReviewAggregate({
    this.transactions: 0,
    this.disputes: 0,
    this.bars: const [
      const Bar.zero(),
      const Bar.one(),
      const Bar.two(),
      const Bar.three(),
      const Bar.four(),
      const Bar.five()
    ]
  });

  num get disputePercent => disputes / transactions;
  num get stars => bars.map((bar) => bar.value).reduce((total, value) => total + value) / bars.length;
}