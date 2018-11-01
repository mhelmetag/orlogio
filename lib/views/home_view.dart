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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Clock(
              currentTimeSeconds: currentTimeSeconds,
            ),
            ClockControls(
              running: running,
              currentTimeSeconds: currentTimeSeconds,
              startFunction: start,
              stopFunction: stop,
              resetFunction: reset,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  EditableMinutes(
                    labelText: 'Work',
                    currentMinutesText: (workTimeSeconds ~/ 60).toString(),
                    addFunction: () {
                      updateWorkTime('add');
                    },
                    removeFunction: () {
                      updateWorkTime('remove');
                    },
                  ),
                  EditableMinutes(
                    labelText: 'Break',
                    currentMinutesText: (breakTimeSeconds ~/ 60).toString(),
                    addFunction: () {
                      updateBreakTime('add');
                    },
                    removeFunction: () {
                      updateBreakTime('remove');
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
