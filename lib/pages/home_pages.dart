import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'coding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("the app")),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to flutter $days days $name'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
