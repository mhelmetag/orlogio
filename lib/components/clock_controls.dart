import 'package:flutter/material.dart';

import '../colors.dart';

class ClockControls extends StatelessWidget {
  final bool running;
  final int currentTimeSeconds;
  final Function startFunction;
  final Function stopFunction;
  final Function resetFunction;

  ClockControls({
    this.running,
    this.currentTimeSeconds,
    this.startFunction,
    this.stopFunction,
    this.resetFunction,
  });

  @override
  build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, right: 10, bottom: 15, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: running ? null : startFunction,
            child: new Text('Start'),
            color: kPomodoroGreen,
          ),
          RaisedButton(
            onPressed: running ? stopFunction : null,
            child: new Text('Stop'),
            color: kPomodoroGreen,
          ),
          RaisedButton(
            onPressed: running ? null : resetFunction,
            child: new Text('Reset'),
            color: kPomodoroGreen,
          ),
        ],
      ),
    );
  }
}
