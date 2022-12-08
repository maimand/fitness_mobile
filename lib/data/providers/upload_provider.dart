import 'package:dio/dio.dart';
import 'package:fitness_mobile/constants/api_constants.dart';
import 'package:fitness_mobile/services/network_service.dart';

class UploadFileProvider {
  final NetWorkService networkService;

  UploadFileProvider(this.networkService);

  Future<HttpResponse> uploadFile({required String path}) async {
    return networkService.post(uploadUrl,
        formData: {'file': await MultipartFile.fromFile(path)});
  }
}