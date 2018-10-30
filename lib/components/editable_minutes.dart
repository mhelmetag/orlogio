import 'package:flutter/material.dart';

class EditableMinutes extends StatelessWidget {
  final String labelText;
  final String currentValueText;
  final Function addFunction;
  final Function removeFunction;

  EditableMinutes({this.labelText, this.currentValueText, this.addFunction, this.removeFunction});

  @override
  build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(labelText),
        RaisedButton(
          child: Icon(Icons.add),
          onPressed: addFunction
        ),
        Text(currentValueText),
        RaisedButton(
          child: Icon(Icons.remove),
          onPressed: removeFunction
        )
      ],
    );
  }
}