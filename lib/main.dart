import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';
import 'Pages/login_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        "/": (context) => login_Page(),
        "/home": (context) => HomePage()
      },
    );
  }
}

