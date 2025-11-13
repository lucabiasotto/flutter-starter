/*
 * Project: Flutter Starter
 * File: auth_controller.dart
 * 
 * Created: 2025-11-13 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2025, Luca Biasotto
 */
import 'dart:collection';

import 'package:get/get.dart';
import 'package:logging/logging.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final _log = Logger('AuthController');

  /// Dati dell'utente autenticato
  var userData = Rxn<HashMap>(); //TODO customize with your user model

  @override
  void onInit() {
    super.onInit();
    //TODO setup auth listener
    //TODO load authentication state
  }

  @override
  void onClose() {
    //TODO cleanup auth listener
    super.onClose();
  }

  Future<void> signIn(String email, String password) async {
    _log.fine("🔐 Signing in user with email: $email");
    //TODO implement sign in logic
    userData.value = HashMap.from({
      'email': email,
      'name': 'Demo User',
    });
  }

  Future<void> signOut() async {
    _log.fine("🔐 Signing out user...");
    //TODO implement sign out logic
    userData.value = null;
  }
}
