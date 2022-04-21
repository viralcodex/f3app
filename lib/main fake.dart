import 'package:f3app/pages/login_page.dart';
import 'package:f3app/widget/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/community.dart';
import 'pages/user.dart';
import 'pages/store.dart';
import 'pages/challenge.dart';
import 'widget/navdraw.dart';
import 'package:f3app/theme/apptheme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    NavDrawer(),
    NavBar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: _widgetOptions[_selectedIndex],
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _widgetOptions[1];
            } else {
              return LoginPage();
            }
          },
        ),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
