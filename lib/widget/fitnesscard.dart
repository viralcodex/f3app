import 'package:flutter/material.dart';

class FitnessCards extends StatelessWidget {
  const FitnessCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
