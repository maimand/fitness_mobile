import 'package:fitness_mobile/data/models/user.model.dart';
import 'package:fitness_mobile/data/repositories/auth_repository.dart';
import 'package:fitness_mobile/utils/dialog_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CalculateFatController extends GetxController {
  final AuthRepository authRepository;

  CalculateFatController(this.authRepository);

  Future<bool> onPredictFat(
      UserInfoAdvancePredictRequest request, Function(double) onCallback) async {
    try {
      showLoading();
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
    } finally {
      EasyLoading.dismiss();
    }

  }
}
