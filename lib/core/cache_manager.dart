import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  final box = GetStorage();

  Future<bool> saveToken(String? token) async {
    if (token != "") {
      await box.write(CacheManagerKey.token.toString(), token);
    }

    return true;
  }

  String? getToken() {
    return box.read(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    await box.remove(CacheManagerKey.token.toString());
  }
}

enum CacheManagerKey {
  token,
}
