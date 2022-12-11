import 'package:dio/dio.dart';
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
    getUserInformation(init: true);
    super.onInit();
  }

  void onLogin(String username, String password) async {
    try {
      EasyLoading.show();
      final res = await authRepository.login(username, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', res.accessToken!);
      getUserInformation();
    } on DioError {
      Get.snackbar(
        'Login Error', 'Wrong email or password'
      );
    }
    EasyLoading.dismiss();
  }

  Future<void> getUserInformation({bool init = false}) async {
    EasyLoading.show();
    try {
      final res = await authRepository.getUserInfo();
      userModel.value = res;
      if (userModel.value?.fatPercent == null) {
        Get.offAll(() => const SignUpAdditionalInfoScreen());
      } else {
        Get.offAll(() => const HomeView());
      }
    } on Exception {
      if(!init) {
        Get.snackbar('Get User Info Error', 'System Error');
      }
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
    } on Exception {
      Get.snackbar('Register failed', 'System Error');
    }
    EasyLoading.dismiss();
  }

  void onResetPassword(String oldPass, String newPass) async {
    try {
      EasyLoading.show();
      await authRepository.resetPassword(oldPass, newPass);
      Get.snackbar('Successful', 'Update your password');
      Get.back();
    } on Exception {
      Get.snackbar('Reset password failed', 'System Error');
    }
    EasyLoading.dismiss();
  }

  void logout() async {
    Get.offAll(() => const LoginScreen());
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');
  }
}
