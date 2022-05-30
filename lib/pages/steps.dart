import 'dart:async';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:f3app/theme/apptheme.dart';

class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

final FirebaseAuth auth = FirebaseAuth.instance;
int savedStepsCount = 0;
int currSteps = 0;

class _StepsState extends State<Steps> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  String _status = '0', _steps = '0';
  int todaySteps = 0;
  double calories = 0;
  double distance = 0;
  double totdist = 0;
  double totcalorie = 0;
  int totcoins = 0;
  int coins = 0, coin = 0, counter = 1000;
  int level = 0, totlevel = 0;
  int i = 1, j = 1, flag = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> onStepCount(StepCount event) async {
    print(event);
    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;

    final User user = auth.currentUser!;
    final uid = user.uid;
    final stepsref = FirebaseFirestore.instance.collection('steps');
    var savedref = await stepsref.doc(uid).get();

    if (savedref.exists) {
      Map<String, dynamic>? data = savedref.data();
      savedStepsCount = data?['savedStepCount'];
      //print(savedStepsCount);
    }

    currSteps = event.steps;
    // print(currSteps);
    if (currSteps < savedStepsCount) {
      savedStepsCount = 0;
      final doc1User = FirebaseFirestore.instance.collection('steps').doc(uid);
      await doc1User.update({'savedStepCount': savedStepsCount});
    }

    int lastDaySaved = 0;
    final dayref = FirebaseFirestore.instance.collection('steps');
    var daysref = await dayref.doc(uid).get();
    if (daysref.exists) {
      Map<String, dynamic>? data = daysref.data();
      lastDaySaved = data?['lastDaySaved'];
    }

    if (lastDaySaved < todayDayNo) {
      DateTime days = DateTime.now();
      var date = DateFormat('yyyy-MM-dd');
      String formattedDate = date.format(days);
      String day = DateFormat('EEEE').format(days);

      final dailystepsref =
          FirebaseFirestore.instance.collection('daywise-steps').doc(uid);
      await dailystepsref.set({'$formattedDate $day': currSteps});

      lastDaySaved = todayDayNo;
      savedStepsCount = currSteps;

      var json2 = {
        'lastDaySaved': lastDaySaved,
        'savedStepCount': savedStepsCount,
      };

      final doc2User = FirebaseFirestore.instance.collection('steps').doc(uid);
      await doc2User.update(json2);
    }

    setState(() {
      todaySteps = currSteps - savedStepsCount;
      _steps = todaySteps.toString();
      calories = calorieCounter(todaySteps);
      distance = distCounter(todaySteps);
      coins = coinCounter(todaySteps);
      //print(_steps);
    });
    totlevel = totlevel + level;
    totcoins = totcoins + coins;
    totdist = totdist + distance;
    totcalorie = totcalorie + calories;
    final doc3User = FirebaseFirestore.instance.collection('steps').doc(uid);
    await doc3User.update({
      'calories': calories,
      'coins': coins,
      'currSteps': todaySteps,
      'distance': distance,
      'level': level,
      'totcalorie': totcalorie,
      'totcoins': totcoins,
      'totdist': totdist,
      'totlevel': totlevel,
    });
  }

  double calorieCounter(int steps) {
    double calories = (steps) * 0.043;
    return calories;
  }

  double distCounter(int steps) {
    double distance = (steps) * 0.60;
    return distance;
  }

  int coinCounter(int steps) {
    int temp = todaySteps;
    int flags = 0;
    if (todaySteps >= counter && flags == 0) {
      flags = 1;
      while (temp >= 1000) {
        temp -= 1000;
        counter += 1000;
        level++;
        coin += 2;
      }
    }
    if (flags == 1 && todaySteps <= counter) {
      flags = 0;
    }
    return coin;
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    //print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    //print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    // if (kDebugMode) {
    //   print('onStepCountError: $error');
    // }
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  //void _onDone() => print("Finished pedometer tracking");

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    //  _pedometer = Pedometer();
    // _pedestrianStatusStream = _pedometer.stepCountStream.listen();
    // _pedestrianStatusStream.listen(
    //   onPedestrianStatusChanged,
    //   onError: onStepCountError,
    //   onDone: _onDone,
    //   cancelOnError: true,
    // );
    //.onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          title: Text(
            "Step Counter",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          //iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Steps Walked Today',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps,
                style: TextStyle(fontSize: 60),
              ),
              Divider(
                height: 50,
                thickness: 0,
                color: Colors.white,
              ),
              Text(
                'Pedestrian status:',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status == "0" ? "Unknown" : _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Container(
                child: Text(
                  'Distance Covered (m)',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                child: Text(
                  '${double.parse(distance.toStringAsFixed(2))}',
                  style: TextStyle(fontSize: 60),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .06,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        'Stop walking',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
