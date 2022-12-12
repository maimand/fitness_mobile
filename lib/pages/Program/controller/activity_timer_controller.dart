import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/data/repositories/exercise_repository.dart';
import 'package:fitness_mobile/pages/Program/controller/program_controller.dart';
import 'package:fitness_mobile/services/log_service.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseTimerController extends GetxController {
  final ExerciseRepository exerciseRepository;
  final LogService logService;
  final ProgramController programController;

  ExerciseTimerController(
      this.logService, this.exerciseRepository, this.programController);

  List<ExerciseDetailModel> exercises = <ExerciseDetailModel>[];
  RxBool isLoading = true.obs;
  late YoutubePlayerController videoController;

  RxInt currentIndex = 0.obs;

  ExerciseDetailModel get currentExercise =>
      exercises.elementAt(currentIndex.value);

  @override
  void onInit() {
    initExercise();
    initVideo();
    super.onInit();
  }

  initVideo() {
    final videoId = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=bYMUb4uQZoo');
    videoController = YoutubePlayerController(
      initialVideoId: videoId ?? '',
    );
  }

  @override
  void onClose() {
    videoController.dispose();
  }

  Future<void> initExercise() async {
    try {
      List<Future<ExerciseDetailModel>> requests = programController.exercises
          .map((element) => exerciseRepository.getExerciseDetailByName(
              name: element.name ?? ''))
          .toList();
      final res = await Future.wait(requests);
      exercises.addAll(res);
    } on Exception catch (e) {
      Get.snackbar('Get Exercise Detail Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getNextExercise() async {
    try {
      final res = await exerciseRepository.getExerciseDetailByName(
          name: programController.exercises
                  .elementAt(currentIndex.value + 1)
                  .name ??
              '');
      exercises.add(res);
    } on Exception catch (e) {
      Get.snackbar('Get Exercise Detail Failed', e.toString());
    }
  }

  void onDone() {
    if (currentIndex.value < programController.exercises.length - 1) {
      currentIndex.value++;
      logService.logExercise(currentExercise);
    } else {
      Get.back();
      Get.snackbar('Congratulations', 'Your workout is completed!!');
    }
  }
}
