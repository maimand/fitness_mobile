import 'package:fitness_mobile/data/models/user.model.dart';
import 'package:fitness_mobile/data/repositories/auth_repository.dart';
import 'package:fitness_mobile/pages/Login/login_screen.dart';
import 'package:fitness_mobile/tabs/home_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {

  final AuthRepository authRepository;

  UserModel? userModel;

  AuthService(this.authRepository);

  @override
  void onInit() {
    getUserInformation();
    super.onInit();
  }

  void onLogin(String username, String password) async {
    try {
      final res = await authRepository.login(username, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', res.accessToken!);
      getUserInformation();
    } on Exception catch (e) {
      Get.snackbar('Login Error', e.toString(), );
    }
  }

  Future<void> getUserInformation() async {
    try {
      final res = await authRepository.getUserInfo();
      userModel = res;
      Get.offAll(() => const HomeView());
    } on Exception catch (e) {
      Get.snackbar('Get User Info Error', e.toString());
    }
  }

  void onRegister({required String username, required String password, String? code}) {
    Get.offAll(() => const LoginScreen());
  }

  void logout() {
    Get.offAll(() => const LoginScreen());
  }
}