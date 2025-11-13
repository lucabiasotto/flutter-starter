/*
 * Project: Flutter Starter
 * File: controller.dart
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2023 - 2024, Luca Biasotto
 */

import 'dart:collection';

import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/sample_controller.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final _log = Logger('AppController');

  late final AuthController _authController;
  late final SampleController _sampleController;

  /// True if the app is still loading initial data
  final isAppLoading = false.obs;

  /// True if user is authenticated
  var isUserAuthenticated = false.obs;

  /// True if onboarding is done
  var onboardingDone = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    //TODO init db, storage, ecc
    _initializeControllers();
    _setupListeners();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? onboardingDone = prefs.getBool('onboardingDone');
    if (onboardingDone != null) {
      this.onboardingDone.value = onboardingDone;
    }
  }

  /// Inizializza tutti i controller specializzati
  void _initializeControllers() {
    _authController = Get.put(AuthController());
    _sampleController = Get.put(SampleController());
    _log.fine("🎮 AppController initialized with specialized controllers");
  }

  void _setupListeners() {
    ever(_sampleController.isLoading, _updateAppLoadingState);

    ever(_authController.userData, (HashMap? user) {
      if (user != null) {
        _log.fine("🔄 User authenticated, loading user-specific data...");
        isUserAuthenticated.value = true;
        _fetchAll();
      } else {
        _log.fine("🔄 User signed out, clearing user-specific data...");
        isUserAuthenticated.value = false;
        _clearAll();
      }
    });
  }

  Future<void> _fetchAll() async {
    //TODO fetch user-specific data
  }

  Future<void> _clearAll() async {
    //TODO clear user-specific data
  }

  void _updateAppLoadingState(bool isLoading) {
    isAppLoading.value = _sampleController.isLoading.value; //TODO add other controllers loading states in "OR"
  }

  void setOnboardingDone(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingDone', value);
    onboardingDone.value = value;
  }
}
