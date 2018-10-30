import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  final double clockTextSize;
  final int currentTimeSeconds;

  Clock({this.clockTextSize, this.currentTimeSeconds});

  String stringTime() {
    var minutes = (currentTimeSeconds ~/ 60);
    var minutesString = minutes.toString().padLeft(2, '0');

    var seconds = currentTimeSeconds - (minutes * 60);
    var secondsString = seconds.toString().padLeft(2, '0');

    return "$minutesString:$secondsString";
  }

  @override
  build(BuildContext context) {
    return Text(
      stringTime(),
      style: TextStyle(fontSize: clockTextSize)
    );
  }
}