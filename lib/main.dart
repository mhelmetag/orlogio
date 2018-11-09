import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme.dart';
import 'screens/home_screen.dart';

void main() => runApp(Orlogio());

class Orlogio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Orlogio',
      theme: kOrlogioTheme,
      home: HomeScreen(),
    );
  }
}
