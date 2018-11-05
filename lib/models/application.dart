/// The Application state of our app. It will be the state of our ApplicatiionBloc class.
/// This class can hold global information on our application like title, theme etc
/// This class is cross-platform and can be used on Flutter, AngularDart and on server side.

import 'package:meta/meta.dart';

class Application {
  String title;
  Application({@required this.title}) : assert(title != null);
}
