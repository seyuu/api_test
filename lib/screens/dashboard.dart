import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const String routeName = "/dashboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dashboard list"),
      ),
      body: Container(
        child: Center(
          child: Text("dashboard"),
        ),
      ),
    );
  }
}
