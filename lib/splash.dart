import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_soal/core/authentication.dart';
import 'package:test_soal/widget/loading.dart';

import 'onboard.dart';

class SplashView extends StatelessWidget {
  final Authentication _authmanager = Get.put(Authentication());

  SplashView({Key? key}) : super(key: key);

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnBoard();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }
}
