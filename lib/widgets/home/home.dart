/*
 * Project: Flutter Starter
 * File: home.dart
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2024, Luca Biasotto
 */

import 'package:app/controllers/sample_controller.dart';
import 'package:app/widgets/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        title: const Text("Home"),
      ),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("hello".tr),
            const SizedBox(height: 20),
            Obx(
              () => Text("Clicks: ${SampleController.to.count}"),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              child: const Text("Go to Settings"),
              onPressed: () => Get.to(
                Settings(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: SampleController.to.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
