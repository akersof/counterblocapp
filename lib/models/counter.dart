/// The counter of our app. It will be the state of our CounterBloc class.
/// This class is cross-platform and can be used on Flutter, AngularDart and on server side.

class Counter {
  int _count;
  Counter([this._count = 0]);
  int get count => _count;
  void increment([int inc = 1]) => _count += inc;
  void decrement([int dec = -1]) => increment(dec);
}