import 'package:f3app/pages/login_page.dart';
import 'package:f3app/widget/navbar.dart';
import 'package:f3app/widget/routing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/authpage.dart';
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

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Routing();
              // Routing(0);
            } else {
              return AuthPage();
            }
          },
        ),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
