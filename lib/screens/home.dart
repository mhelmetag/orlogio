import 'dart:async';

import 'package:flutter/material.dart';

import '../components/clock.dart';
import '../components/clock_controls.dart';

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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(widget.title)
        )
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Clock(currentTimeSeconds: _currentTimeSeconds),
            new ClockControls(
              running: _running,
              currentTimeSeconds: _currentTimeSeconds,
              startFunction: start,
              stopFunction: stop,
              resetFunction: reset
            )
          ],
        )
      )
    );
  }
}