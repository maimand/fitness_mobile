import 'package:fitness_mobile/data/models/user.model.dart';
import 'package:fitness_mobile/data/repositories/auth_repository.dart';
import 'package:fitness_mobile/pages/Login/login_screen.dart';
import 'package:fitness_mobile/pages/Signup/sign_up_additional_info.dart';
import 'package:fitness_mobile/tabs/home_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  final AuthRepository authRepository;

  Rxn<UserModel> userModel = Rxn();

  AuthService(this.authRepository);

  @override
  void onInit() {
    getUserInformation();
    super.onInit();
  }

  void onLogin(String username, String password) async {
    try {
      EasyLoading.show();
      final res = await authRepository.login(username, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', res.accessToken!);
      getUserInformation();
    } on Exception catch (e) {
      Get.snackbar(
        'Login Error',
        e.toString(),
      );
    }
    EasyLoading.dismiss();
  }

  Future<void> getUserInformation() async {
    EasyLoading.show();
    try {
      final res = await authRepository.getUserInfo();
      userModel.value = res;
      if (userModel.value?.fatPercent == null) {
        Get.offAll(() => const SignUpAdditionalInfoScreen());
      } else {
        Get.offAll(() => const HomeView());
      }
    } on Exception catch (e) {
      Get.snackbar('Get User Info Error', e.toString());
    }
    EasyLoading.dismiss();
  }

  void onRegister(
      {required String username,
      required String password,
      required String email,
      required String code}) async {
    try {
      EasyLoading.show();

      await authRepository.register(
          fullname: username, password: password, email: email, code: code);
      Get.offAll(() => const SignUpAdditionalInfoScreen());
    } on Exception catch (e) {
      Get.snackbar('Register failed', e.toString());
    }
    EasyLoading.dismiss();
  }

  void onResetPassword(String oldPass, String newPass) async {
    try {
      EasyLoading.show();
      await authRepository.resetPassword(oldPass, newPass);
      Get.snackbar('Successful', 'Update your password');
      Get.back();
    } on Exception catch (e) {
      Get.snackbar('Register failed', e.toString());
    }
    EasyLoading.dismiss();
  }

  void logout() async {
    Get.offAll(() => const LoginScreen());
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');
  }
}
