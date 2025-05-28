/*
 * Project: Flutter Starter
 * File: main.dart
 * 
 * Created: 2024-09-29 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2025, Luca Biasotto
 */
import 'dart:developer' as dev;

import 'package:app/controllers/app_controller.dart';
import 'package:app/controllers/settings_controller.dart';
import 'package:app/widgets/home/home.dart';
import 'package:app/theme/theme.dart';
import 'package:app/translations/translation.dart';
import 'package:app/widgets/onboarding/onboarding.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';

Locale locale = const Locale('en', 'US');
final List appLanguages = [
  {'name': 'English', 'locale': const Locale('en', 'US')},
  {'name': 'Italiano', 'locale': const Locale('it', 'IT')},
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Init logging
  Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
    );
  });

  final log = Logger('main');
  log.fine("🚀 Starting app...");

  log.fine("🕹️ Inizializing controllers...");

  //Init settings
  Get.put(SettingsController());

  Get.put(AppController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        /*
        Decommento to use device material color

        final lightTheme = getLightTheme(lightColor, colorSchemeLight);
        final lightMaterialTheme = getLightTheme(lightColorScheme?.surface, lightColorScheme);

        final darkTheme = getDarkTheme(darkColor, colorSchemeDark);
        final darkMaterialTheme = getDarkTheme(darkColor, darkColorScheme);

        final appTheme = SettingsController.to.materialColor
            ? lightColorScheme != null
                ? lightMaterialTheme
                : lightTheme
            : lightTheme;

        final appDarkTheme = SettingsController.to.materialColor
            ? darkColorScheme != null
                ? darkMaterialTheme
                : darkTheme
            : darkTheme;
          */

        final appTheme = getLightTheme();
        final appDarkTheme = getDarkTheme();

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //theme
          themeMode: SettingsController.to.theme,
          theme: appTheme,
          darkTheme: appDarkTheme,
          //language
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: appLanguages.map((e) => e['locale'] as Locale).toList(),
          translations: Translation(), // your translations
          locale: SettingsController.to.language,
          fallbackLocale: const Locale('en', 'US'), // specify the fallback locale in case an invalid locale is selected.
          home: Obx(
            () => SettingsController.to.onboardingDone.value ? const Home() : Onboarding(),
          ),
        );
      },
    );
  }
}
