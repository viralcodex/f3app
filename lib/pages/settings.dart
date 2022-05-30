import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: ListTile(
              title: Text("Logout"),
            ),
          )
        ],
      ),
    );
  }

  void _selectedOption(BuildContext context, int index) {
    switch (index) {
      case 0:
        break;
    }
  }
}
