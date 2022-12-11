import 'package:fitness_mobile/data/models/user.model.dart';
import 'package:fitness_mobile/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  final AuthRepository authRepository;

  UpdateProfileController(this.authRepository);

  Future<bool> onPredictFat(
      UserInfoAdvancePredictRequest request, Function(double) onCallback) async {
    try {
      final fat = await authRepository.predictFat(request);
      if (fat == null) {
        throw 'Cannot predict!!';
      }
      final updateRequest = UpdateUserRequest(
          fatPercent: fat,
          age: request.age.toInt(),
          gender: request.sex,
          height: request.height,
          weight: request.weight);
      await authRepository.updateUser(updateRequest);
      onCallback(fat);
      return true;
    } on Exception catch (e) {
      Get.snackbar('Predict Failed', e.toString());
      return false;
    }
  }
}
