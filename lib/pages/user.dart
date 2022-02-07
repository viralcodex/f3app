import 'package:flutter/material.dart';
import 'package:f3app/theme/apptheme.dart';
import 'package:f3app/widget/navdraw.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text(
            "User Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
      ),
      theme: AppTheme.lightTheme,
    );
  }
}
