import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData kPomodoroTheme = _buildPomodoroTheme();

ThemeData _buildPomodoroTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kPomodoroGreenDark,
    primaryColor: kPomodoroRed,
    scaffoldBackgroundColor: kPomodoroBackgroundWhite,
  );
}