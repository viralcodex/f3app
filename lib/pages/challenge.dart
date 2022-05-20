import 'package:f3app/widget/navbar.dart';
import 'package:f3app/widget/routing.dart';
import 'package:flutter/material.dart';
import 'package:f3app/theme/apptheme.dart';
import 'package:f3app/widget/navdraw.dart';

class ChallengePage extends StatelessWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //drawer: NavDrawer(),
        appBar: AppBar(
          title: const Text(
            "Challenge Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: Text(
                    'START A CHALLENGE',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                ),
                SelfChallenges(),
                CommunityChallenges(),
                TimeBased(),
              ],
            ),
          ),
        ),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

Widget SelfChallenges() => Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('Self-Challenges',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 2',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 3',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 4',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ], //children
          ),
        ),
      ),
    );

Widget CommunityChallenges() => Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('Community Challenges',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 2',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 3',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 4',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ], //children
          ),
        ),
      ),
    );

Widget TimeBased() => Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('Daily and Weekly Challenges',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 2',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 3',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(8.0),
                        height: 120,
                        width: 180,
                        child: Text(
                          'Challenge 4',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ], //children
          ),
        ),
      ),
    );
