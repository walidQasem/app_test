import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home',
            style: TextStyle(color: Colors.white, fontSize: 14)),
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Get.toNamed("/users");
              },
              child: const Text("Go to Users"))),
    );
  }
}
