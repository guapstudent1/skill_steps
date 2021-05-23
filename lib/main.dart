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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Переход на другой экран
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
    // Создать первый экран
    final MyRoute myFirstRoute = MyRoute(step: 0, onNext: (step){_next(step+1);});

    return myFirstRoute;
  }
}
