import 'package:fitness_mobile/components/next_step.dart';
import 'package:fitness_mobile/models/exercise.dart';
import 'package:fitness_mobile/pages/Program/controller/program_controller.dart';
import 'package:fitness_mobile/pages/Program/activity_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDetail extends StatelessWidget {
  final String tag;
  final Exercise exercise;

  const ActivityDetail({
    Key? key,
    required this.exercise,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final controller = Get.find<ProgramController>();
    controller.getExercise(tag);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: tag,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Image.asset(
                      exercise.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        exercise.title,
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        height: 90.0,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(231, 241, 255, 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 55.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey[300]),
                                  ),
                                  Text(
                                    '${exercise.time}',
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 45.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Intensity',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.blueGrey[300],
                                    ),
                                  ),
                                  Text(
                                    exercise.difficult,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: <Widget>[
                              ...controller.exercises.value.map(
                                (e) => NextStep(
                                  title: e.name ?? '',
                                  rep: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(100, 140, 255, 1.0),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(100, 140, 255, 0.5),
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                ),
              ]),
          child: const Text(
            'Start',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          Get.to(() => const ActivityTimer());
        },
      ),
    );
  }
}
