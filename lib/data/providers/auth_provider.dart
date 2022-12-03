import 'package:fitness_mobile/constants/api_constants.dart';
import 'package:fitness_mobile/services/network_service.dart';

class AuthProvider {
  final NetWorkService networkService;

  AuthProvider(this.networkService);

  final String loginUrl =
      '$baseUrl/user/login';
  final String registerUrl =
      '$baseUrl/auth/register';
  final String forgotUrl =
      '$baseUrl/auth/forgot';
  final String reset = '$baseUrl/auth/reset';
  final String userInfoUrl = '$baseUrl/user/get-info';

  Future<HttpResponse> login(String username, String password) {
    return networkService
        .post(loginUrl, data: {"username": username, "password": password});
  }

  Future<HttpResponse> getUserInfo() {
    return networkService.get(userInfoUrl);
  }

  Future<HttpResponse> register(
      String username, String password, String firstName, String lastName) {
    return networkService.post(registerUrl, data: {
      "email": username,
      "password": password,
      "firstName": firstName,
      "lastName": lastName
    });
  }

  Future<HttpResponse> forgotPassword(String email) {
    return networkService.post(forgotUrl, data: {"email": email});
  }

  // Future<HttpResponse> resetPassword(String password) {
  //   final json = storage.read(user);
  //   final u = UserModel.fromJson(json);
  //   if (u.resetToken == null) throw Exception('Reset token is not available');
  //   return networkService
  //       .post('$reset/${u.resetToken}', data: {"password": password});
  // }
}
