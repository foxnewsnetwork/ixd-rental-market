part of data;

class Bar {
  final int weight;
  final int amount;

  const Bar({
    @required this.weight,
    @required this.amount
  });

  const Bar.zero({
    int amount: 0
  }) : this(amount: amount, weight: 0);

  const Bar.one({
    int amount: 0
  }) : this(amount: amount, weight: 1);

  const Bar.two({
    int amount: 0
  }) : this(amount: amount, weight: 2);

  const Bar.three({
    int amount: 0
  }) : this(amount: amount, weight: 3);

  const Bar.four({
    int amount: 0
  }) : this(amount: amount, weight: 4);

  const Bar.five({
    int amount: 0
  }) : this(amount: amount, weight: 5);

  int get value => amount * weight;
}

int _sum(int total, int value) => total + value;

class ReviewAggregate {
  final int transactions;
  final int disputes;
  final List<Bar> bars;

  const ReviewAggregate({
    this.transactions: 0,
    this.disputes: 0,
    this.bars: const [
      const Bar.five(),
      const Bar.four(),
      const Bar.three(),
      const Bar.two(),
      const Bar.one(),
      const Bar.zero()
    ]
  });

  num get disputePercent => disputes / transactions;
  num get stars => bars.map((bar) => bar.value).reduce(_sum) / totalAmount;
  num get totalAmount => bars.map((bar) => bar.amount).reduce(_sum);
}