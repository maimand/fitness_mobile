import 'package:fitness_mobile/pages/Program/controller/activity_timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ActivityTimer extends StatelessWidget {

  const ActivityTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExerciseTimerController(
      Get.find(),
      Get.find(),
      Get.find(),
    ));
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
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
                            controller.dispose();
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                    height: Get.height - 270.0,
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  controller.currentExercise.name ?? '',
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  'Reps: 8',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: SingleChildScrollView(
                                    child: Text(controller
                                            .currentExercise.instructions ??
                                        ''),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () {
                            controller.onDone();
                          },
                          child: Container(
                            width: Get.width,
                            height: 55.0,
                            decoration: BoxDecoration(
                              color:
                              Colors.red,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
