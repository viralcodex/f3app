// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:f3app/theme/apptheme.dart';
import 'package:f3app/widget/navdraw.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser!;
final uid = user.uid;
final stepsref = FirebaseFirestore.instance.collection('steps');
final namesref = FirebaseFirestore.instance.collection('user-details');
final dailysteps = FirebaseFirestore.instance.collection('daywise-steps');
DateTime days = DateTime.now();
var date = DateFormat('yyyy-MM-dd');
String formattedDate = date.format(days);
String day = DateFormat('EEEE').format(days);

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              UserBanner(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              FitnessCards(context),
              LevelCounter(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              FitnessHistory(context),
              FitnessList(context),
            ],
          ),
        ),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }

  Widget UserBanner(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/pics/profile-pic.png'),
                radius: 50,
              ),
            ),
            const Text(
              'Test',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const Text('@testuser'),
          ],
        ),
      );

  Widget FitnessCards(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.width * .20,
              width: MediaQuery.of(context).size.width * .45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Total Steps Count',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: stepsref.doc(uid).get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var output = snapshot.data!.data();
                        var totsteps = output!['totsteps'];
                        return Text(
                          '${totsteps == 'null' ? 0 : totsteps}',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.width * .20,
              width: MediaQuery.of(context).size.width * .45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Total Coins',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    future: stepsref.doc(uid).get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var output = snapshot.data!.data();
                        var totcoins = output!['totcoins'];
                        return Text(
                          '$totcoins',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget LevelCounter(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.width * .175,
                width: MediaQuery.of(context).size.width * .925,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //alignment: Alignment.topLeft,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: stepsref.doc(uid).get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var output = snapshot.data!.data();
                                var level = output!['totlevel'];
                                return Text(
                                  'Level $level',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
                        // Container(
                        //   child: Text('Know More'),
                        // )
                      ],
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(top: 10),
                    //   alignment: Alignment.bottomLeft,
                    //   child: Text(
                    //       'Reach 2 coins more TODAY and upgrade to level 2',
                    //       style: TextStyle(fontSize: 12.5)),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget FitnessHistory(BuildContext context) => Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topLeft,
              child: Text(
                'Fitness History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      );

  Widget FitnessList(BuildContext context) => Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.black12,
          alignment: Alignment.centerLeft,
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: dailysteps.doc(uid).get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var output = snapshot.data!.data();
                var days = output!['$formattedDate $day'];
                return Text(
                  '$day: $days',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      );
}
