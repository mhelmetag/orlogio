import 'package:flutter/material.dart';

import 'components/home.dart';

void main() => runApp(new PomodoroClock());

class PomodoroClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pomodoro Clock',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Home(title: 'Pomodoro Clock'),
    );
  }
}
