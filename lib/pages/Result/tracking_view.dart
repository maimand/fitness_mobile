import 'package:fitness_mobile/pages/Result/widgets/exercise_log_list.dart';
import 'package:fitness_mobile/pages/Result/widgets/food_log_list.dart';
import 'package:flutter/material.dart';

class TrackingView extends StatelessWidget {
  const TrackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Your tracking',
            ),
            bottom: TabBar(
              tabs: const <Widget>[
                Tab(text: 'Exercise'),
                Tab(text: 'Diet'),
                Tab(text: 'Body'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[400],
              indicatorWeight: 4.0,
              indicatorColor: const Color.fromRGBO(215, 225, 255, 1.0),
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              ExerciseLogList(),
              DietLogList(),
              Center(
                child: Text(
                  'Body',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
