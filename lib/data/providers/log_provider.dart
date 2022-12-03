import 'package:fitness_mobile/constants/api_constants.dart';
import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/services/network_service.dart';

class LogProvider {
  final NetWorkService networkService;

  LogProvider(this.networkService);

  final String exerciseLogUrl = '$baseUrl/logs/exercise-logs';
  final String dietLogUrl = '$baseUrl/logs/food-logs';

  Future<HttpResponse> getDietLogs(
      {String? food, required int page, required int size}) {
    return networkService.get(
      dietLogUrl,
    );
    // queryParameters: {"page": page , "size": size});
  }

  Future<HttpResponse> postDietLog({required FoodLog log}) {
    return networkService.post(dietLogUrl, data: log.toJson());
    // queryParameters: {"page": page , "size": size});
  }

  // Future<HttpResponse> getFoodDetailByName({required String name}) {
  //   return networkService.get('$getDietUrl/$name');
  // }
}
