import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData kOrlogioTheme = _buildOrlogioTheme();

ThemeData _buildOrlogioTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kOrlogioRedLight,
    primaryColor: kOrlogioGreenLight,
    scaffoldBackgroundColor: kOrlogioGreenLight,
  );
}