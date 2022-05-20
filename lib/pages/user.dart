import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:f3app/theme/apptheme.dart';
import 'package:f3app/widget/navdraw.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //drawer: NavDrawer(),
        appBar: AppBar(
          title: const Text(
            "User Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView(children: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const ListTile(
              title: Text("Logout"),
            ),
          ),
        ]),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
