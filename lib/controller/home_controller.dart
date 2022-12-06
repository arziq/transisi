import 'package:get/get.dart';
import 'package:test_soal/model/karyawan_response_model.dart';

import '../core/remote_service.dart';

class HomeController extends GetxController {
  late final AuthService service;

  RxList<Datum> dataKaryawan = <Datum>[].obs;

  @override
  void onInit() {
    service = Get.put(AuthService());
    super.onInit();
  }

  Future<bool> getKaryawan() async {
    try {
      final response = await service.fetchGetKaryawan();

      if (response != null) {
        dataKaryawan.value = response.data;
      }
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<bool> addKaryawan(String nama, String job) async {
    var data = {
      "name": nama,
      "job": job,
    };
    try {
      final response = await service.fetchAddKaryawan(data);

      if (response != null) {
        dataKaryawan.add(
          Datum(
              id: int.parse(response.id),
              email: "${response.name}@test.com",
              firstName: response.name,
              lastName: response.name,
              avatar: "https://reqres.in/img/faces/7-image.jpg"),
        );
        dataKaryawan.refresh();
        Get.snackbar("Success", "Berhasil menambahkan data",
            snackPosition: SnackPosition.BOTTOM);
      }
      return true;
    } catch (e) {
      return true;
    }
  }
}
