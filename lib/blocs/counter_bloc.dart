/// The BLoC of our Counter state.
/// This Class provides input/output to our Counter for our dart application.
/// This class is cross-platform and can be used on Flutter, AngularDart and on server side.

import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:counterbloc_app/models/counter.dart';

class CounterBloc {
  //state
  final _counter = Counter();

  //input
  final _incrementController = StreamController<void>();
  Sink<void> get increment => _incrementController.sink;

  //output
  final _itemCountController = BehaviorSubject<int>();
  ValueObservable<int> get itemCount => _itemCountController.stream.distinct().shareValue(seedValue: _counter.count);

  //constructor
  CounterBloc() {
    //listen for input and trigger callback _onData for incoming event
    _incrementController.stream.listen(_onData);
  }
  //onData received
  void _onData(void _) {
    _counter.increment();
    //send the new _counter value to listeners
    _itemCountController.sink.add(_counter.count);

  }
  //dispose/close all the streams when we call dispose() method
  void dispose() {
    _itemCountController.close();
    _incrementController.close();
  }

}