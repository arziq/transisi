import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_soal/controller/home_controller.dart';
import 'package:test_soal/widget/texfield.dart';

class AddKaryawan extends StatefulWidget {
  final HomeController home;
  const AddKaryawan({super.key, required this.home});

  @override
  State<AddKaryawan> createState() => _AddKaryawanState();
}

class _AddKaryawanState extends State<AddKaryawan> {
  final namaController = TextEditingController();
  final pekerjaanController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    pekerjaanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[400],
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(label: "Nama", controller: namaController),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    label: "Pekerjaan", controller: pekerjaanController),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.home.addKaryawan(
                        namaController.text, pekerjaanController.text);
                    Get.back();
                  },
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
