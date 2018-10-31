import 'package:flutter/material.dart';

import '../views/home_view.dart';

class Home extends StatefulWidget {
  final String title;

  Home({this.title});

  @override
  HomeView createState() => new HomeView();
}