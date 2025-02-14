/*
 * Project: Flutter Starter
 * File: controller.dart
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2023 - 2024, Luca Biasotto
 */

import 'package:get/get.dart';
import 'package:logging/logging.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final _log = Logger('AppController');

  var count = 0.obs;
  increment() => count++;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    _log.fine("🕹️ inizialize somethings...");
    //init db
    //load user data
    //ecc ecc
  }
}
