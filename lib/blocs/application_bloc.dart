/// The BLoC of our Application state.
/// This Class provides input/output on our Application class for our dart application.
/// This class is cross-platform and can be used on Flutter, AngularDart and on server side.

import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:counterbloc_app/models/application.dart';

class ApplicationBloc {
  //state
  final _app = Application(title: "Demo app with BLoC");

  //output
  final _titleController = BehaviorSubject<String>();
  ValueObservable<String> get title => _titleController.stream.distinct().shareValue(seedValue: _app.title);

  //dispose/close all the streams when we call dispose() method
  void dispose() {
    _titleController.close();
  }

}
