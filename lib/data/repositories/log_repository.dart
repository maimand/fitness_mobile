import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/providers/log_provider.dart';

class LogRepository {

  final LogProvider provider;

  LogRepository(this.provider);

  Future<void> postFoodLog({required FoodLog log}) async {
    await provider.postDietLog(log: log);
  }

  // Future<List<ExerciseModel>> getExerc({String name = ''}) async {
  //   final response = await provider.getExercises(exerciseName: name);
  //   final result = (response.body['data'] as List).map((e) => ExerciseModel.fromJson(e)).toList();
  //   return result;
  // }
  //
  // Future<ExerciseDetailModel> getExerciseDetailByName({required String name}) async {
  //   final response = await provider.getExerciseDetailByName(name: name);
  //   final result = ExerciseDetailModel.fromJson(response.body['data']);
  //   return result;
  // }
}
