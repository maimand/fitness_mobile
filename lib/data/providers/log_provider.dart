import 'package:fitness_mobile/constants/api_constants.dart';
import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/services/network_service.dart';

class LogProvider {
  final NetWorkService networkService;

  LogProvider(this.networkService);

  final String exerciseLogUrl = '$baseUrl/logs/exercises-logs';
  final String dietLogUrl = '$baseUrl/logs/food-logs';
  final String bodyLogUrl = '$baseUrl/logs/body-logs';

  Future<HttpResponse> getDietLogs(
      {int page = 1, int size = 20}) {
    return networkService.get(
      dietLogUrl,
    );
  }

  Future<HttpResponse> getExerciseLogs(
      {int page = 1, int size = 20}) {
    return networkService.get(
      exerciseLogUrl,
    );
  }

  Future<HttpResponse> getBodyLogs(
      {int page = 1, int size = 20}) {
    return networkService.get(
      bodyLogUrl,
    );
  }

  Future<HttpResponse> postDietLog({required FoodLogRequest log}) {
    return networkService.post(dietLogUrl, data: log.toJson());
  }

  Future<HttpResponse> postExerciseLog({required ExerciseLogRequest log}) {
    return networkService.post(exerciseLogUrl, data: log.toJson());
  }

  Future<HttpResponse> postBodyLog({required String image}) {
    return networkService.post(bodyLogUrl, data: {'image': image});
  }
}
