import 'package:flutter/material.dart';
import 'mystep.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: MyHomePage(title: 'Flutter Makeup')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _next(int step)
  {
    if (step==5) return;
    MyRoute myNextRoute = new MyRoute(step: step, onNext: (step){_next(step+1);});

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => myNextRoute)
    );
  }
  @override
  Widget build(BuildContext context) {
    final MyRoute myFirstRoute = MyRoute(step: 0, onNext: (step){_next(step+1);});

    return myFirstRoute;
  }
}
