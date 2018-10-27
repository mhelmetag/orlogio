import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;
  final Duration tickDuration;

  Home({this.title, this.tickDuration = const Duration(seconds: 1)});

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Timer _timer;
  int _currentTimeSeconds;
  bool _running;

  @override
  void initState() {
    super.initState();
    _currentTimeSeconds = 300;
    _running = false;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  void start() {
    setState(() {
      _running = true;
    });
    this._timer = new Timer.periodic(widget.tickDuration, tick);
  }

  void stop() {
    setState(() {
      _running = false;
    });
    _timer.cancel();
  }

  void reset() {
    setState(() {
      _currentTimeSeconds = 300;
    });
  }

  void tick(Timer time) {
    if (_currentTimeSeconds <= 0) {
      stop();
    } else {
      setState(() {
        _currentTimeSeconds--;
      });
    }
  }

  String stringTime() {
    var minutes = (_currentTimeSeconds ~/ 60);
    var minutesString = minutes.toString().padLeft(2, '0');

    var seconds = _currentTimeSeconds - (minutes * 60);
    var secondsString = seconds.toString().padLeft(2, '0');

    return "$minutesString:$secondsString";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title)
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              stringTime(),
              style: TextStyle(fontSize: 100)
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: (_running || _currentTimeSeconds == 0) ? null : start,
                  child: new Text('Start')
                ),
                new RaisedButton(
                  onPressed: _running ? stop : null,
                  child: new Text('Stop')
                ),
                new RaisedButton(
                  onPressed: _running ? null : reset,
                  child: new Text('Reset')
                )
              ],
            )
          ],
        )
      )
    );
  }
}