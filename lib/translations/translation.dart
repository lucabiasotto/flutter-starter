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
          // Onboarding
          'onboarding': 'Onboarding',
          'welcome': 'Welcome',
          'explore': 'Explore',
          'get_started': 'Get Started',
          'welcome_description': 'Discover all the app features and start using it right away.',
          'explore_description': 'Navigate through different sections and customize your experience.',
          'get_started_description': 'Everything is ready! You can now start using the application.',
          'back': 'Back',
          'next': 'Next',
        },
        'it_IT': {
          'hello': 'Ciao Mondo',
          'settings': 'Impostazioni',
          // Onboarding
          'onboarding': 'Onboarding',
          'welcome': 'Benvenuto',
          'explore': 'Esplora',
          'get_started': 'Inizia',
          'welcome_description': 'Scopri tutte le funzionalità dell\'app e inizia subito a utilizzarla.',
          'explore_description': 'Naviga tra le diverse sezioni e personalizza la tua esperienza.',
          'get_started_description': 'Tutto è pronto! Puoi ora iniziare a utilizzare l\'applicazione.',
          'back': 'Indietro',
          'next': 'Avanti',
        }
      };
}
