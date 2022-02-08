import 'package:flutter/material.dart';
import 'package:f3app/widget/navdraw.dart';
import 'package:f3app/theme/apptheme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavDrawer(), //Navigation Drawer Widget
        appBar: AppBar(
          title: Text(
            "Home Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          //iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
