import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/services/log_service.dart';
import 'package:fitness_mobile/utils/date_time.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final LogService logService;

  ResultController(this.logService);

  RxList<FoodLog> foodLogs = <FoodLog>[].obs;
  RxList<ExerciseLog> exerciseLogs = <ExerciseLog>[].obs;
  RxBool isLoading = true.obs;

  int get todayCaloriesBurned {
    int total = 0;
    for(var log in exerciseLogs) {
      if(isToday(log.time!)) {
        total += log.totalCaloriesBurn ?? 0;
      }
    }
    return total;
  }

  int get todayCaloriesTaken {
    int total = 0;
    for(var log in foodLogs) {
      if(isToday(log.time!)) {
        total += log.totalCaloriesIntake ?? 0;
      }
    }
    return total;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void getLogs() async {
    try {
      isLoading.value = true;
      List<Future> requests = [
        logService.getDietLogs(),
        logService.getExerciseLogs()
      ];
      final res = await Future.wait(requests);
      foodLogs.assignAll(res[0] as List<FoodLog>);
      exerciseLogs.assignAll(res[1] as List<ExerciseLog>);
    } on Exception catch (e) {
      Get.snackbar('Get Result Failed', e.toString());
    } finally {
      isLoading.value = false;
    }

  }
}
