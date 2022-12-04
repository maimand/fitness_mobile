import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/repositories/log_repository.dart';
import 'package:get/get.dart';

class LogService extends GetxService {
  final LogRepository repository;

  LogService(this.repository);

  void logFood(FoodLogRequest log) {
    repository.postFoodLog(log: log);
  }
}