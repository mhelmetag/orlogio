import 'package:flutter/material.dart';

import '../colors.dart';

class EditableMinutes extends StatelessWidget {
  final String labelText;
  final String currentMinutesText;
  final Function addFunction;
  final Function removeFunction;

  EditableMinutes({
    this.labelText,
    this.currentMinutesText,
    this.addFunction,
    this.removeFunction,
  });

  String _minuteString() {
    if (currentMinutesText == "1") {
      return "minute";
    } else {
      return "minutes";
    }
  }

  @override
  build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: 110,
        height: 150,
        decoration: BoxDecoration(
          color: kPomodoroGreen,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              labelText,
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
              child: Icon(Icons.add),
              onPressed: addFunction,
              color: kPomodoroGreenDark,
            ),
            Text("$currentMinutesText ${_minuteString()}"),
            RaisedButton(
              child: Icon(Icons.remove),
              onPressed: removeFunction,
              color: kPomodoroGreenDark,
            ),
          ],
        ),
      ),
    );
  }
}
