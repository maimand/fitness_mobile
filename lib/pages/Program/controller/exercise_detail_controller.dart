import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/data/repositories/exercise_repository.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseDetailController extends GetxController {

  final ExerciseRepository repository;

  ExerciseDetailController(this.repository);

  late YoutubePlayerController videoController;
  Rxn<ExerciseDetailModel> exercise = Rxn();
  RxBool isLoading = true.obs;
  String? videoId;

  @override
  void onClose() {
    videoController.dispose();
  }

  Future<void> getExercise(String exerciseName) async {
    try {

      final res = await repository.getExerciseDetailByName(name: exerciseName);
      exercise.value = res;
      videoId = YoutubePlayer.convertUrlToId(exercise.value?.videoUrl ?? '');
      videoController = YoutubePlayerController(
        initialVideoId: videoId ?? '',
      );
    } on Exception catch (e) {
      Get.snackbar('Get Exercise Detail Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}