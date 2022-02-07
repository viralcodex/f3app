import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/community.dart';
import 'pages/user.dart';
import 'pages/store.dart';
import 'pages/challenge.dart';
import 'widget/navdraw.dart';
import 'package:f3app/theme/apptheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0; //selecting NavBar items
  final List<Widget> screens = [
    HomePage(),
    CommunityPage(),
    StorePage(),
    ChallengePage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var lightTheme = AppTheme.lightTheme;
    return MaterialApp(
      home: Scaffold(
        drawer: NavDrawer(),
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ), //to keep the state of the individual widgets
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(
            () => currentIndex = index,
          ),
          //updating selected items' index
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Community",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: "Store",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: "Challenges",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person",
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),
      theme: AppTheme.lightTheme,
    );
  }
}
