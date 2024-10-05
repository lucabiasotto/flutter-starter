/*
 * Project: Flutter Starter
 * File: onboarding.dart
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2024, Luca Biasotto
 */

import 'package:app/controllers/controller.dart';
import 'package:app/controllers/settings.dart';
import 'package:app/widgets/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  static final _log = Logger('Onboarding');

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(
        title: const Text("ON BOARDING"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Home"),
          onPressed: () {
            _log.fine("Go to Home");
            SettingsCtrl.to.setOnboardingDone(true);
            Get.off(
              () => const Home(),
              transition: Transition.downToUp,
            );
          },
        ),
      ),
    );
  }
}
