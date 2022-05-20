import 'package:flutter/material.dart';
import 'package:f3app/pages/home_page.dart';
import 'package:f3app/pages/community.dart';
import 'package:f3app/pages/user.dart';
import 'package:f3app/pages/store.dart';
import 'package:f3app/pages/challenge.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class NavBar extends StatelessWidget {
  final currentIndex;

  ValueChanged<int> onClicked;

  NavBar({this.currentIndex, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onClicked,
      //updating selected items' index
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: "Friends",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: "Store",
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.leaderboard),
        //   label: "Challenges",
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    );
  }
}
