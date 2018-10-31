import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
          onPressed:
              (running || currentTimeSeconds == 0) ? null : startFunction,
          child: new Text('Start'),
        ),
        RaisedButton(
          onPressed: running ? stopFunction : null,
          child: new Text('Stop'),
        ),
        RaisedButton(
          onPressed: running ? null : resetFunction,
          child: new Text('Reset'),
        ),
      ],
    );
  }
}
