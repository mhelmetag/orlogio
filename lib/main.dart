import 'package:flutter/material.dart';

import 'theme.dart';
import 'screens/home_screen.dart';

void main() => runApp(Orlogio());

class Orlogio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orlogio',
      theme: kOrlogioTheme,
      home: HomeScreen(),
    );
  }
}
