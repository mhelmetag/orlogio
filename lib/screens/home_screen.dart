import 'package:flutter/material.dart';

import '../views/home_view.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({this.title});

  @override
  HomeView createState() => new HomeView();
}