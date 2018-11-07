import 'package:flutter/material.dart';

import '../states/home_state.dart';
import '../components/clock.dart';
import '../components/clock_controls.dart';
import '../components/editable_minutes.dart';
import '../components/status_text.dart';
import '../colors.dart';

class HomeView extends HomeState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrlogioGreenLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StatusText(
              running: running,
              working: working,
            ),
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
                    label: 'Work',
                    currentMinutes: (workTimeSeconds ~/ 60).toString(),
                    addFunction: () {
                      updateWorkTime('add');
                    },
                    removeFunction: () {
                      updateWorkTime('remove');
                    },
                  ),
                  EditableMinutes(
                    label: 'Rest',
                    currentMinutes: (breakTimeSeconds ~/ 60).toString(),
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
