import 'package:fitness_mobile/pages/Program/exercise_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextStep extends StatelessWidget {
  final String title;
  final int rep;

  const NextStep({Key? key,
    required this.title,
    required this.rep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ExerciseDetail(exerciseName: title));
      },
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 65.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '$rep reps',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blueGrey[200],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}