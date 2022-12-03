import 'package:fitness_mobile/constants/api_constants.dart';
import 'package:fitness_mobile/services/network_service.dart';

class DietProvider {
  final NetWorkService networkService;

  DietProvider(this.networkService);

  final String getDietUrl = '$baseUrl/diet';

  Future<HttpResponse> getDiet(
      {String? food, required int page, required int size}) {
    return networkService.get(getDietUrl,
        queryParameters: {"name": food, "page": page , "size": size});
  }

  Future<HttpResponse> getFoodDetailByName({required String name}) {
    return networkService.get('$getDietUrl/$name');
  }
}
