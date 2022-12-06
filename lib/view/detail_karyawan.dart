import 'package:flutter/material.dart';

class DetailKaryawan extends StatelessWidget {
  final String name;
  final String email;
  final String avatar;
  const DetailKaryawan(
      {super.key,
      required this.name,
      required this.email,
      required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Karyawan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(avatar),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
