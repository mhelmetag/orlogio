import 'package:flutter/material.dart';

import 'package:pomodoro_clock/screens/home_screen.dart';

void main() => runApp(new PomodoroClock());

class PomodoroClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Pomodoro Clock',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.grey
      ),
      home: new HomeScreen(title: 'Pomodoro Clock')
    );
  }
}
