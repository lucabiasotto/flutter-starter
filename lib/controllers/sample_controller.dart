/*
 * Project: Flutter Starter
 * File: sample_controller.dart
 * 
 * Created: 2025-11-13 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2025, Luca Biasotto
 */

import 'package:get/get.dart';
import 'package:logging/logging.dart';

class SampleController extends GetxController {
  static SampleController get to => Get.find();
  final _log = Logger('SampleController');

  var isLoading = false.obs;

  var count = 0.obs;
  increment() => count++;

  Future<void> fetchData() async {
    _log.fine("📥 Fetching sample data...");
    isLoading.value = true;
    try {
      //TODO implement data fetching logic
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      _log.severe("❌ Error fetching sample data: $e");
    } finally {
      isLoading.value = false;
    }
    _log.fine("✅ Sample data fetched successfully.");
  }
}
