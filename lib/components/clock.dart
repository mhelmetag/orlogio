import 'package:flutter/material.dart';

import '../colors.dart';

class Clock extends StatelessWidget {
  final int currentTimeSeconds;

  Clock({
    this.currentTimeSeconds,
  });

  String _stringTime() {
    var minutes = (currentTimeSeconds ~/ 60);
    var minutesString = minutes.toString().padLeft(2, '0');

    var seconds = currentTimeSeconds - (minutes * 60);
    var secondsString = seconds.toString().padLeft(2, '0');

    return "$minutesString:$secondsString";
  }

  @override
  build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: kPomodoroGreenDark,
        shape: BoxShape.circle,
        border: Border.all(
          color: kPomodoroGreen,
          width: 5,
        ),
      ),
      child: Center(
        child: Text(
          _stringTime(),
          style: TextStyle(
            fontSize: 80,
          ),
        ),
      ),
    );
  }
}
