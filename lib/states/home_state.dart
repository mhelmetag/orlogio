import 'dart:async';

import 'package:flutter/material.dart';

import '../screens/home.dart';

abstract class HomeState extends State<Home> {
  @protected
  Timer timer;
  Duration tickDuration = new Duration(seconds: 1);
  int workTimeSeconds = 1500; // 25 minutes
  int breakTimeSeconds = 300; // 5 minutes
  int currentTimeSeconds = 1500;
  bool running = false;
  bool working = true;

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  @protected
  void start() {
    setState(() {
      running = true;
    });
    timer = new Timer.periodic(tickDuration, _tick);
  }

  @protected
  void stop() {
    setState(() {
      running = false;
    });
    timer.cancel();
  }

  @protected
  void reset() {
    setState(() {
      currentTimeSeconds = workTimeSeconds;
      working = true;
    });
  }

  @protected
  void updateTime(String action, String timeRef) {
    if (_shouldUpdateTime(timeRef)) {
      int seconds = _secondsForTimeUpdate(action);

      switch (timeRef) {
        case ('work'):
          setState(() {
            workTimeSeconds = workTimeSeconds + seconds;
          });
          break;
        case ('break'):
          setState(() {
            breakTimeSeconds = breakTimeSeconds + seconds;
          });
          break;
        default:
          throw ArgumentError;
      }
    }
  }

  void _tick(Timer time) {
    if (currentTimeSeconds <= 0) {
      setState(() {
        currentTimeSeconds = working ? breakTimeSeconds : workTimeSeconds;
        working = !working;
      });
    } else {
      setState(() {
        currentTimeSeconds--;
      });
    }
  }

  bool _shouldUpdateTime(timeRef) {
    bool shouldUpdateTime;

    switch (timeRef) {
      case ('work'):
        shouldUpdateTime = workTimeSeconds <= 1 && workTimeSeconds >= 59;
        break;
      case ('break'):
        shouldUpdateTime = breakTimeSeconds <= 1 && breakTimeSeconds >= 59;
        break;
      default:
        throw ArgumentError;
    }

    return shouldUpdateTime;
  }

  int _secondsForTimeUpdate(String action) {
    int seconds;

    switch (action) {
      case ('add'):
        seconds = 60;
        break;
      case ('remove'):
        seconds = -60;
        break;
      default:
        throw ArgumentError;
    }

    return seconds;
  }
}
