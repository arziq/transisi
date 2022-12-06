import 'package:get/get.dart';
import 'package:test_soal/model/add_response_model.dart';
import 'package:test_soal/model/karyawan_response_model.dart';
import '../resources/strings.dart';
import 'cache_manager.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class AuthService extends GetConnect with CacheManager {
  final String listKaryawanUrl = '${Strings.apiBaseUrl}api/users';
  final String loginUrl = '${Strings.apiBaseUrl}api/login';

  // Login
  Future fetchLogin(Map data) async {
    try {
      final response = await post(
          loginUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          data);

      if (response.statusCode == 200) {
        return response.body["token"];
      } else if (response.statusCode == null) {
        throw ("Check Your Connection");
      } else {
        throw (response.body["error"] ?? "Check Your Connection");
      }
    } catch (e) {
      rethrow;
    }
  }

// List Karyawan
  Future<KaryawanResponseModel?> fetchGetKaryawan() async {
    try {
      final response = await get(listKaryawanUrl, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        return KaryawanResponseModel.fromJson(response.body);
      } else if (response.statusCode == null) {
        throw ("Check Your Connection");
      } else {
        throw (response.body["status"] ?? "Check Your Connection");
      }
    } catch (e) {
      rethrow;
    }
  }

// List Karyawan
  Future<AddResponseModel?> fetchAddKaryawan(Map data) async {
    try {
      final response = await post(
        listKaryawanUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        data,
      );

      if (response.statusCode == 201) {
        return AddResponseModel.fromJson(response.body);
      } else if (response.statusCode == null) {
        throw ("Check Your Connection");
      } else {
        throw (response.statusText ?? "Check Your Connection");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    removeToken();
    return true;
  }
}
