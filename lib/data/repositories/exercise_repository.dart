import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/data/providers/program_provider.dart';

class ExerciseRepository {

  final ProgramProvider provider;

  ExerciseRepository(this.provider);

  Future<List<ExerciseModel>> getExercisesByBodyPart({String name = ''}) async {
    final response = await provider.getExercises(exerciseName: name);
    final result = (response.body['data'] as List).map((e) => ExerciseModel.fromJson(e)).toList();
    return result;
  }

  Future<ExerciseDetailModel> getExerciseDetailByName({required String name}) async {
    final response = await provider.getExerciseDetailByName(name: name);
    final result = ExerciseDetailModel.fromJson(response.body['data']);
    return result;
  }
}
