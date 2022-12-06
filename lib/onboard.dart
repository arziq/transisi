import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_soal/core/authentication.dart';
import 'package:test_soal/view/home.dart';
import 'package:test_soal/view/login.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Authentication authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ? HomePage() : const LoginPage();
    });
  }
}
