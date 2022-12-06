import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_soal/controller/home_controller.dart';
import 'package:test_soal/view/add_karyawan.dart';
import 'package:test_soal/view/login.dart';
import 'package:test_soal/widget/loading.dart';

import 'detail_karyawan.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              _homeController.service
                  .logout()
                  .then((value) => Get.to(() => const LoginPage()));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: _homeController.getKaryawan(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (_homeController.dataKaryawan.isEmpty) {
                  return const Center(child: Text("Data Kosong"));
                } else {
                  return Obx(
                    () => ListView.builder(
                      itemCount: _homeController.dataKaryawan.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => DetailKaryawan(
                                name: _homeController
                                    .dataKaryawan[index].firstName,
                                email:
                                    _homeController.dataKaryawan[index].email,
                                avatar:
                                    _homeController.dataKaryawan[index].avatar,
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            child: ListTile(
                              title: Text(_homeController
                                  .dataKaryawan[index].firstName),
                              subtitle: Text(
                                  _homeController.dataKaryawan[index].email),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              } else {
                return const Loading();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => AddKaryawan(
              home: _homeController,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
