import 'package:fitness_mobile/components/daily_tip.dart';
import 'package:fitness_mobile/components/header.dart';
import 'package:fitness_mobile/components/image_card_with_basic_footer.dart';
import 'package:fitness_mobile/components/image_card_with_internal.dart';
import 'package:fitness_mobile/components/main_card_programs.dart';
import 'package:fitness_mobile/components/section.dart';
import 'package:fitness_mobile/components/user_photo.dart';
import 'package:fitness_mobile/data/repositories/exercise_repository.dart';
import 'package:fitness_mobile/models/exercise.dart';
import 'package:fitness_mobile/pages/Program/controller/program_controller.dart';
import 'package:fitness_mobile/pages/Program/activity_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Programs extends StatelessWidget {
  final List<Exercise> exercises = [
    Exercise(
      image: 'assets/images/image001.jpg',
      title: 'Easy Start',
      time: '5 min',
      difficult: 'Low',
    ),
    Exercise(
      image: 'assets/images/image002.jpg',
      title: 'Medium Start',
      time: '10 min',
      difficult: 'Medium',
    ),
    Exercise(
      image: 'assets/images/image003.jpg',
      title: 'Pro Start',
      time: '25 min',
      difficult: 'High',
    )
  ];

  Programs({Key? key}) : super(key: key);

  List<Widget> generateList(BuildContext context) {
    List<Widget> list = [];
    int count = 0;
    for (var exercise in exercises) {
      Widget element = Container(
        margin: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          child: ImageCardWithBasicFooter(
            exercise: exercise,
            tag: 'imageHeader$count',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ActivityDetail(
                    exercise: exercise,
                    tag: 'imageHeader$count',
                  );
                },
              ),
            );
          },
        ),
      );
      list.add(element);
      count++;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(
      ProgramController(Get.find<ExerciseRepository>()),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                const Header(
                  'Programs',
                  rightSide: UserPhoto(),
                ),
                MainCardPrograms(), // MainCard
                const Section(
                  title: 'Body part focus',
                  horizontalList: <Widget>[
                    ImageCardWithInternal(
                      image: 'https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/health/wp-content/uploads/2022/06/960x0-3-1.jpg',
                      title: 'Chest \nWorkout',
                      duration: '7 min',
                      tag: 'pectoralis major',
                    ),
                    ImageCardWithInternal(
                      image: 'https://fitnessvolt.com/wp-content/uploads/2022/06/30-Minute-Shoulder-Workout-750x422.jpg',
                      title: 'Shoulder \nWorkout',
                      duration: '7 min',
                      tag: 'latissimus dorsi',
                    ),
                    ImageCardWithInternal(
                      image: 'https://www.bodybuilding.com/images/2021/march/10-best-back-exercises-for-muscle-skinny-v2-830x467.jpg',
                      title: 'Back \nWorkout',
                      duration: '7 min',
                      tag: 'latissimus dorsi',
                    ),
                    ImageCardWithInternal(
                      image: 'https://www.bodybuilding.com/images/2016/june/leg-workouts-for-men-7-best-workouts-for-quads-glutes-hams-header-v2-830x467.jpg',
                      title: 'Legs \nWorkout',
                      duration: '7 min',
                      tag: 'gluteus medius',
                    ),
                    ImageCardWithInternal(
                      image: 'https://www.wheystore.vn/upload/news_optimize/wst_1605081641_abs_workout_la_gi__top_10_bai_tap_abs_workout_co_ban_cho_nguoi_moi_image_1605081641_1.jpg',
                      title: 'Abs \nWorkout',
                      duration: '7 min',
                      tag: 'abdominals',
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                  ),
                  child: Column(
                    children: const <Widget>[
                      Section(
                        title: 'Daily tips',
                        horizontalList: <Widget>[
                          DailyTip(
                            element: {
                              'title': '16 Main workout tips',
                              'subtitle':
                                  'The American Council on Exercises (ACE) recently surveyed 3,000 ACE-certificated personal trainers about the best!',
                              'image': 'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                              'url': 'https://zenhabits.net/16-tips-to-triple-your-workout-effectiveness/',
                            },
                          ),
                          DailyTip(
                            element: {
                              'title': '10 Best Weight Gain Exercises, According to Experts & Research',
                              'subtitle':
                                  'Just like with losing weight, gaining weight is also possible by exercising only if you follow a proper diet and have a healthy lifestyle. Men and women will also have different exercise needs when talking about weight gain. In this article, we will be talking about natural weight gain with a focus on the exercises for the same. Whether you are looking for weight gain exercise for men or women, you will find them in the upcoming sections of this article. Read ahead to find out more.',
                              'image': 'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                              'url': 'https://blog.decathlon.in/articles/weight-gain-exercise',
                            },
                          ),
                          DailyTip(
                            element: {
                              'title': 'How To Lose Weight In The Gym: 4 Simple Steps',
                              'subtitle':
                                  'Losing weight and getting fit is really straightforward when you come to think of it. It doesn’t require crash-dieting, drinking detox teas or sacrificing the food you love.',
                              'image': 'https://images.pexels.com/photos/2729899/pexels-photo-2729899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                              'url': 'https://www.wikihow.com/Lose-Weight-at-the-Gym',
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
