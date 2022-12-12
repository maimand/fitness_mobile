import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/data/repositories/exercise_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController {
  final ExerciseRepository repository;

  ProgramController(this.repository);

  RxList<ExerciseModel> exercises = <ExerciseModel>[].obs;

  Future<void> getExercise(String part) async {
    try {
      exercises.clear();
      EasyLoading.show();
      final res = await repository.getExercisesByBodyPart(name: part);
      exercises.assignAll(res);
    } on Exception catch (e) {
      Get.snackbar('Get Exercise Failed', e.toString());
    }
    EasyLoading.dismiss();

  }
}