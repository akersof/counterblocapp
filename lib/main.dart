import 'package:flutter/material.dart';
import 'package:counterbloc_app/providers/application_provider.dart';
import 'package:counterbloc_app/providers/counter_provider.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApplicationProvider(child: CounterProvider(child: MyHomePage())),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _appBloc = ApplicationProvider.of(context);
    final _counterBloc = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(

        title: StreamBuilder<String>(
            stream: _appBloc.title,
            initialData: _appBloc.title.value,
            builder:(context, snapshot) => Text(snapshot.data),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: _counterBloc.itemCount,
              initialData: _counterBloc.itemCount.value,
              builder:(context, snapshot) => Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counterBloc.increment.add(null),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
