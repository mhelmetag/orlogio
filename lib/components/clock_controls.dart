import 'package:flutter/material.dart';

class ClockControls extends StatelessWidget {
  final bool running;
  final int currentTimeSeconds;
  final Function startFunction;
  final Function stopFunction;
  final Function resetFunction;

  ClockControls({this.running, this.currentTimeSeconds, this.startFunction, this.stopFunction, this.resetFunction});

  @override
  build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new RaisedButton(
          onPressed: (running || currentTimeSeconds == 0) ? null : startFunction,
          child: new Text('Start')
        ),
        new RaisedButton(
          onPressed: running ? stopFunction : null,
          child: new Text('Stop')
        ),
        new RaisedButton(
          onPressed: running ? null : resetFunction,
          child: new Text('Reset')
        )
      ],
    );
  }
}