import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  int number = 10;
  String name = "Flutter";

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("Flutter App"),
    ),
    body:Center(
      child: Container(
        child: Text("Welcome to $name"),
      ),
    ),
    drawer: Drawer(),
  );
  }

}