import 'dart:async';

import 'package:flutter/material.dart';

import '../components/clock.dart';
import '../components/clock_controls.dart';
import '../components/editable_minutes.dart';

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

  void updateWorkTime(type) {
    int newWorkTimeSeconds;

    switch(type) {
      case 'add':
        newWorkTimeSeconds = _workTimeSeconds + 60;
        break;
      case 'remove':
        newWorkTimeSeconds = _workTimeSeconds - 60;
        break;
      default:
        throw ArgumentError;
    }

    setState(() {
      _workTimeSeconds = newWorkTimeSeconds;
    });
  }

  void updateBreakTime(type) {
    int newBreakTimeSeconds;

    switch(type) {
      case 'add':
        newBreakTimeSeconds = _breakTimeSeconds + 60;
        break;
      case 'remove':
        newBreakTimeSeconds = _breakTimeSeconds - 60;
        break;
      default:
        throw ArgumentError;
    }

    setState(() {
      _breakTimeSeconds = newBreakTimeSeconds;
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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title)
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                _working ? 'Work' : 'Break',
                style: TextStyle(
                  fontSize: 40
                )
              )
            ),
            Container(
              child: Clock(clockTextSize: 100,currentTimeSeconds: _currentTimeSeconds)
            ),
            Container(
              child: ClockControls(
                running: _running,
                currentTimeSeconds: _currentTimeSeconds,
                startFunction: start,
                stopFunction: stop,
                resetFunction: reset
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  EditableMinutes(
                    labelText: 'Work Minutes',
                    currentValueText: (_workTimeSeconds ~/ 60).toString(),
                    addFunction: () { updateWorkTime('add'); },
                    removeFunction: () { updateWorkTime('remove'); }
                  ),
                  EditableMinutes(
                    labelText: 'Break Minutes',
                    currentValueText: (_breakTimeSeconds ~/ 60).toString(),
                    addFunction: () { updateBreakTime('add'); },
                    removeFunction: () { updateBreakTime('remove'); }
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}