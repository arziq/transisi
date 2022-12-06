import 'package:get/get.dart';

import '../core/authentication.dart';
import '../core/cache_manager.dart';
import '../core/remote_service.dart';

class LoginController extends GetxController with CacheManager {
  final RxBool checkbox = false.obs;
  final RxString errTextLogin = "".obs;
  final RxString errTextPin = "".obs;

  late final Authentication _authManager;

  RxBool isLoading = false.obs;
  late final AuthService _service;

  @override
  void onInit() {
    _service = Get.put(AuthService());
    super.onInit();
    _authManager = Get.find();
  }

  Future<bool> loginUser(String email, String pass) async {
    var data = {
      "email": email,
      "password": pass,
    };
    try {
      final response = await _service.fetchLogin(data);
      _authManager.saveCache(response);
      return true;
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 1),
        ),
      );
      return false;
    }
  }
}
