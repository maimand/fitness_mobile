import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/data/repositories/exercise_repository.dart';
import 'package:fitness_mobile/data/repositories/log_repository.dart';
import 'package:get/get.dart';

class LogService extends GetxService {
  final LogRepository repository;
  final ExerciseRepository exerciseRepository;

  LogService(this.repository, this.exerciseRepository);

  void logFood(Food food, int number) {
    final log = FoodLogRequest(food.id ?? '', food.name ?? '', number,
        (food.calo?.toInt() ?? 0) * number);
    repository.postFoodLog(log: log);
  }

  void logExercise(ExerciseDetailModel exercise) async {
    final log = ExerciseLogRequest(
        exercise.name ?? '', 8, (exercise.caloriesBurn?.toInt() ?? 0) * 8);
    repository.postExerciseLog(log: log);
  }

  Future<List<FoodLog>> getDietLogs() async {
    final res = await repository.getDietLog();
    return res;
  }

  Future<List<ExerciseLog>> getExerciseLogs() async {
    final res = await repository.getExerciseLog();
    return res;
  }
}
