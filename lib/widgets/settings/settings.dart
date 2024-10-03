/*
 * Project: Flutter Starter
 * File: settings.dart
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2024, Luca Biasotto
 */

import 'package:app/controllers/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final SettingsCtrl settings = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                settings.changeLanguage(const Locale('it', 'IT'));
                Get.back();
              },
              child: const Text("IT"),
            ),
            ElevatedButton(
              onPressed: () {
                settings.changeLanguage(const Locale('en', 'US'));
                Get.back();
              },
              child: const Text("EN"),
            ),
            ElevatedButton(
              onPressed: () {
                settings.changeTheme(ThemeMode.dark);
              },
              child: const Text("Dark"),
            ),
            ElevatedButton(
              onPressed: () {
                settings.changeTheme(ThemeMode.light);
              },
              child: const Text("Light"),
            ),
          ],
        ),
      ),
    );
  }
}
