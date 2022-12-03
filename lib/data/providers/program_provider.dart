import 'package:fitness_mobile/constants/api_constants.dart';
import 'package:fitness_mobile/services/network_service.dart';

class ProgramProvider {

  final NetWorkService networkService;

  ProgramProvider(this.networkService);

  final String getExercisesUrl =
      '$baseUrl/exercises';

  Future<HttpResponse> getExercises({String? exerciseName}) {
    return networkService
        .get(getExercisesUrl, queryParameters: {"name": exerciseName});
  }

  Future<HttpResponse> getExerciseDetailByName({required String name}) {
    return networkService.get('$getExercisesUrl/$name');
  }

}
