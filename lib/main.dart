import 'package:flutter/material.dart';

import 'theme.dart';
import 'package:pomodoro_clock/screens/home_screen.dart';

void main() => runApp(new PomodoroClock());

class PomodoroClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Pomodoro Clock',
        theme: kPomodoroTheme,
        home: HomeScreen(
          title: 'Pomodoro Clock',
        ));
  }
}
