import 'package:fitness_mobile/constants/api_constants.dart';
import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/data/repositories/log_repository.dart';
import 'package:fitness_mobile/data/repositories/upload_repository.dart';
import 'package:fitness_mobile/services/log_service.dart';
import 'package:fitness_mobile/utils/date_time.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ResultController extends GetxController {
  final LogService logService;
  final LogRepository logRepository;
  final UploadFileRepository uploadFileRepository;

  ResultController(
      this.logService, this.logRepository, this.uploadFileRepository);

  RxList<FoodLog> foodLogs = <FoodLog>[].obs;
  RxList<ExerciseLog> exerciseLogs = <ExerciseLog>[].obs;
  RxList<BodyLog> bodyLogs = <BodyLog>[].obs;
  RxBool isLoading = true.obs;
  final ImagePicker _picker = ImagePicker();

  int get todayCaloriesBurned {
    int total = 0;
    for (var log in exerciseLogs) {
      if (isToday(log.time!)) {
        total += log.totalCaloriesBurn ?? 0;
      }
    }
    return total;
  }

  int get todayCaloriesTaken {
    int total = 0;
    for (var log in foodLogs) {
      if (isToday(log.time!)) {
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
        logService.getExerciseLogs(),
        logRepository.getBodyLogs(),
      ];
      final res = await Future.wait(requests);
      foodLogs.assignAll(res[0] as List<FoodLog>);
      exerciseLogs.assignAll(res[1] as List<ExerciseLog>);
      bodyLogs.assignAll(res[2] as List<BodyLog>);
    } on Exception catch (e) {
      Get.snackbar('Get Result Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void getBodyLog() async {
    try {
      List<Future> requests = [
        logRepository.getBodyLogs(),
      ];
      final res = await Future.wait(requests);
      bodyLogs.assignAll(res[0] as List<BodyLog>);
      bodyLogs.refresh();
    } on Exception catch (e) {
      Get.snackbar('Get body log  Failed', e.toString());
    }
  }

  void searchWithCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 60,
    );

    postFile(pickedFile);
  }

  void postFile(XFile? pickedFile) async {
    if (pickedFile == null) {
      return;
    }
    try {
      final url = await uploadFileRepository.uploadFile(pickedFile.path);
      await logRepository.postBodyLog(uploadUrl + url);
      getBodyLog();

      Get.snackbar('Success', 'Add body log');
    } on Exception catch (e) {
      Get.snackbar('Predict Food Failed', e.toString());
    }
  }

  void searchWithGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );
    postFile(pickedFile);
  }
}
