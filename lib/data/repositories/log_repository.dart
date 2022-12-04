import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/data/providers/log_provider.dart';

class LogRepository {
  final LogProvider provider;

  LogRepository(this.provider);

  Future<void> postFoodLog({required FoodLogRequest log}) async {
    await provider.postDietLog(log: log);
  }

  Future<List<FoodLog>> getDietLog() async {
    final response = await provider.getDietLogs();
    final result = (response.body['data'] as List)
        .map((e) => FoodLog.fromJson(e))
        .toList();
    return result;
  }

  Future<void> postExerciseLog({required ExerciseLogRequest log}) async {
    await provider.postExerciseLog(log: log);
  }

  Future<List<ExerciseLog>> getExerciseLog() async {
    final response = await provider.getExerciseLogs();
    final result = (response.body['data'] as List)
        .map((e) => ExerciseLog.fromJson(e))
        .toList();
    return result;
  }
}
