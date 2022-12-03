import 'package:fitness_mobile/components/Header.dart';
import 'package:fitness_mobile/components/circle_bedge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Header('Results'),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 35.0),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(241, 227, 255, 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'Body Progress',
                        style: TextStyle(
                          color: Color.fromRGBO(190, 130, 255, 1.0),
                          fontSize: 18.0,
                        ),
                      ),
                      Icon(
                        Icons.camera_alt,
                        color: Color.fromRGBO(190, 130, 255, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 20.0,
                ),
                width: width,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(231, 241, 248, 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Achivments',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleBadge(
                            color: const Color.fromRGBO(190, 130, 255, 1.0),
                            title: '1st',
                            subtitle: 'Workout',
                          ),
                          CircleBadge(
                            color: const Color.fromRGBO(75, 142, 255, 1.0),
                            title: '1000',
                            subtitle: 'kCal',
                          ),
                          CircleBadge(
                            color: const Color.fromRGBO(255, 255, 255, 1.0),
                            title: '6000',
                            subtitle: 'kCal',
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'You\'ve burned',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '480 kCal',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            '6000 kCal',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: RoundedProgressBar(
                        height: 25.0,
                        style: RoundedProgressBarStyle(
                          borderWidth: 0,
                          widthShadow: 0,
                        ),
                        margin: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 16.0,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        percent: 28.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 55.0,
                  left: 20.0,
                  right: 20.0,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Weight Progress',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    // Container(
                    //   height: 250.0,
                    //   width: width - 40.0,
                    //   margin: const EdgeInsets.only(bottom: 30.0),
                    //   child: BezierChart(
                    //     bezierChartScale: BezierChartScale.CUSTOM,
                    //     xAxisCustomValues: const [0, 3, 6, 9],
                    //     series: const [
                    //       BezierLine(
                    //         lineColor: Color.fromRGBO(241, 227, 255, 1.0),
                    //         lineStrokeWidth: 8.0,
                    //         data: [
                    //           DataPoint<double>(value: 45, xAxis: 0),
                    //           DataPoint<double>(value: 80, xAxis: 3),
                    //           DataPoint<double>(value: 55, xAxis: 6),
                    //           DataPoint<double>(value: 100, xAxis: 9)
                    //         ],
                    //       ),
                    //     ],
                    //     config: BezierChartConfig(
                    //       xAxisTextStyle: const TextStyle(color: Colors.blueGrey),
                    //       startYAxisFromNonZeroValue: true,
                    //       backgroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: width * 0.60 - 5.0,
                          height: 100.0,
                          margin: const EdgeInsets.only(right: 5.0),
                          padding: const EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(231, 241, 255, 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 45.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Weight',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.blueGrey[200],
                                      ),
                                    ),
                                    const Text(
                                      '56 Kg',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Gaind',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.blueGrey[200],
                                      ),
                                    ),
                                    const Text(
                                      '13 Kg',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.30 - 10.0,
                          height: 100.0,
                          padding: const EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(241, 227, 255, 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Goal',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blueGrey[200],
                                ),
                              ),
                              const Text(
                                'Add +',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(190, 129, 255, 1.0),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 45.0,
                        horizontal: 30.0,
                      ),
                      child: const Text(
                        'Track your weight every morning before your breakfast',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(25.0),
                      width: width - 40.0,
                      margin: const EdgeInsets.only(bottom: 30.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(241, 227, 255, 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Text(
                        'Enter today\'s weight',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(190, 130, 255, 1.0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}