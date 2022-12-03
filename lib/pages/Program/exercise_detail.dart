import 'package:fitness_mobile/pages/Program/controller/exercise_detail_controller.dart';
import 'package:fitness_mobile/pages/Program/activity_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseDetail extends StatelessWidget {
  final String exerciseName;

  const ExerciseDetail({
    Key? key,
    required this.exerciseName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final ExerciseDetailController controller =
        Get.put(ExerciseDetailController(Get.find()));
    controller.getExercise(exerciseName);
    return Scaffold(
      body: Obx(
        () => !controller.isLoading.value
            ? SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 270,
                          child: YoutubePlayerBuilder(
                            player: YoutubePlayer(
                              controller: controller.videoController,
                              bottomActions: [
                                CurrentPosition(),
                                ProgressBar(isExpanded: true),
                              ],
                            ),
                            builder: (context, player) {
                              return Column(
                                children: [
                                  // some widgets
                                  player,
                                  //some other widgets
                                ],
                              );
                            },
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
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                controller.exercise.value?.name ?? '',
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                margin: const EdgeInsets.only(
                                    top: 20.0, bottom: 20.0),
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(231, 241, 255, 1.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          const EdgeInsets.only(right: 45.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Intensity',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.blueGrey[300],
                                            ),
                                          ),
                                          Text(
                                            controller.exercise.value
                                                    ?.difficulty ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.lightBlue,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.only(right: 45.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Calories',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.blueGrey[300],
                                            ),
                                          ),
                                          Text(
                                            (controller.exercise.value
                                                        ?.caloriesBurn ??
                                                    0)
                                                .toString(),
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
                              Text(
                                  controller.exercise.value?.instructions ?? '')
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Center(
                child: const CircularProgressIndicator(),
              ),
      ),
    );
  }
}
