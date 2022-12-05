import 'package:flutter/material.dart';

class PredictFatResult extends StatelessWidget {
  final double percent;
  const PredictFatResult({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
      ),
      body: Center(
        child: Text(
            'Your fat percentage is $percent. We will set up your program to help you get in fit'),
      ),
    );
  }
}
