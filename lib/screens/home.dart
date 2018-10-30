import 'dart:async';

import 'package:flutter/material.dart';

import '../components/clock.dart';
import '../components/clock_controls.dart';

class Home extends StatefulWidget {
  final String title;

  Home({this.title});

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Timer _timer;
  int _workTimeSeconds;
  int _breakTimeSeconds;
  int _currentTimeSeconds;
  bool _running;
  bool _working;

  @override
  void initState() {
    super.initState();

    _workTimeSeconds = 1500; // 25 minutes
    _breakTimeSeconds = 300; // 5 minutes
    _currentTimeSeconds = _workTimeSeconds;
    _running = false;
    _working = true;
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
    this._timer = new Timer.periodic(const Duration(seconds: 1), tick);
  }

  void stop() {
    setState(() {
      _running = false;
    });
    _timer.cancel();
  }

  void reset() {
    setState(() {
      _currentTimeSeconds = _workTimeSeconds;
      _working = true;
    });
  }

  void tick(Timer time) {
    if (_currentTimeSeconds <= 0) {
      setState(() {
        _currentTimeSeconds = _working ? _breakTimeSeconds : _workTimeSeconds;
        _working = !_working;
      });
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
            new Text(
              _working ? 'Work' : 'Break',
              style: TextStyle(
                fontSize: 40
              )
            ),
            new Clock(currentTimeSeconds: _currentTimeSeconds),
            new ClockControls(
              running: _running,
              currentTimeSeconds: _currentTimeSeconds,
              startFunction: start,
              stopFunction: stop,
              resetFunction: reset
            )
          ]
        )
      )
    );
  }
}