import 'package:fitness_mobile/data/providers/upload_provider.dart';

class UploadFileRepository {
  final UploadFileProvider provider;

  UploadFileRepository(this.provider);

  Future<String> uploadFile(String path) async {
    try {
      final res = await provider.uploadFile(path: path);
      final String name = res.body as String;
      return name;
    } on Exception {
      rethrow ;
    }
  }
}
