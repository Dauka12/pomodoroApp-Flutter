import 'package:flutter/material.dart';
import 'package:pomodoro/NavBar.dart';

class DeadlinePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) =>Scaffold(
    drawer: NavBar(),
    appBar: AppBar(
      title: Text('Deadline'),
      centerTitle: true,

    ),
  );
}