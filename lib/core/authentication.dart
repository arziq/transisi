import 'package:get/get.dart';

import 'cache_manager.dart';

class Authentication extends GetxController with CacheManager {
  final isLogged = false.obs;

  void saveCache(String? token) async {
    //Token is cached
    await saveToken(
      token,
    );
  }

// to checkLoginStatus
  void checkLoginStatus() async {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    } else {
      isLogged.value = false;
      removeToken();
    }
  }
}
