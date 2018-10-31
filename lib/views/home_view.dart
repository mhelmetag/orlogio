import 'package:flutter/material.dart';

import '../states/home_state.dart';
import '../components/clock.dart';
import '../components/clock_controls.dart';
import '../components/editable_minutes.dart';

class HomeView extends HomeState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                working ? 'Work' : 'Break',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              child: Clock(
                clockTextSize: 100,
                currentTimeSeconds: currentTimeSeconds,
              ),
            ),
            Container(
              child: ClockControls(
                running: running,
                currentTimeSeconds: currentTimeSeconds,
                startFunction: start,
                stopFunction: stop,
                resetFunction: reset,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  EditableMinutes(
                    labelText: 'Work Minutes',
                    currentValueText: (workTimeSeconds ~/ 60).toString(),
                    addFunction: () {
                      updateTime('add', 'work');
                    },
                    removeFunction: () {
                      updateTime('remove', 'work');
                    },
                  ),
                  EditableMinutes(
                    labelText: 'Break Minutes',
                    currentValueText: (breakTimeSeconds ~/ 60).toString(),
                    addFunction: () {
                      updateTime('add', 'break');
                    },
                    removeFunction: () {
                      updateTime('remove', 'break');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
