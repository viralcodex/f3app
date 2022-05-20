import 'package:f3app/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:f3app/pages/home_page.dart';
import 'package:f3app/pages/community.dart';
import 'package:f3app/pages/user.dart';
import 'package:f3app/pages/store.dart';
import 'package:f3app/pages/challenge.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class Routing extends StatefulWidget {
  //const Routing({Key? key}) : super(key: key);
  // int selectIndex;
  // Routing(this.selectIndex);
  @override
  _RoutingState createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  int currentIndex = 0;

  //selecting NavBar items
  final List<Widget> screens = [
    HomePage(),
    CommunityPage(),
    StorePage(),
    //ChallengePage(),
    UserPage(),
  ];

  void onClicked(int index) {
    setState(() {
      currentIndex = index;
      // widget.selectIndex == 0 ? index : widget.selectIndex;
      // widget.selectIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //currentIndex = widget.selectIndex == 0 ? currentIndex : widget.selectIndex;
    return Scaffold(
      body: LazyLoadIndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: NavBar(
        currentIndex: currentIndex,
        onClicked: onClicked,
      ),
    );
  }
}
