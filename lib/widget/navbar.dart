import 'package:flutter/material.dart';
import 'package:f3app/pages/home_page.dart';
import 'package:f3app/pages/community.dart';
import 'package:f3app/pages/user.dart';
import 'package:f3app/pages/store.dart';
import 'package:f3app/pages/challenge.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0; //selecting NavBar items
  final List<Widget> screens = [
    HomePage(),
    CommunityPage(),
    StorePage(),
    ChallengePage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        //updating selected items' index
        items: const [
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
    );
  }
}
