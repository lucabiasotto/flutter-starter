/*
 * Project: Flutter Starter
 * File: translation.dart
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2024, Luca Biasotto
 */

import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'settings': 'Settings',
        },
        'it_IT': {
          'hello': 'Ciao Mondo',
          'settings': 'Impostazioni',
        }
      };
}
