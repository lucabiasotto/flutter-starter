import 'dart:developer' as dev;

import 'package:app/controllers/controller.dart';
import 'package:app/controllers/settings.dart';
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

  final _log = Logger('main');
  _log.fine("Starting app...");

  //Init settings
  final SettingsCtrl settings = Get.put(SettingsCtrl());
  settings.loadSettings();

  final Controller controller = Get.put(Controller());
  //game.loadSettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        final lightTheme = getLightTheme(lightColor, colorSchemeLight);
        final lightMaterialTheme = getLightTheme(lightColorScheme?.surface, lightColorScheme);

        final darkTheme = getDarkTheme(darkColor, colorSchemeDark);
        final darkMaterialTheme = getDarkTheme(darkColor, darkColorScheme);

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //theme
          themeMode: SettingsCtrl.to.theme,
          theme: SettingsCtrl.to.materialColor
              ? lightColorScheme != null
                  ? lightMaterialTheme
                  : lightTheme
              : lightTheme,
          darkTheme: SettingsCtrl.to.materialColor
              ? darkColorScheme != null
                  ? darkMaterialTheme
                  : darkTheme
              : darkTheme,
          //language
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: appLanguages.map((e) => e['locale'] as Locale).toList(),
          translations: Translation(), // your translations
          locale: SettingsCtrl.to.language,
          fallbackLocale: const Locale('en', 'US'), // specify the fallback locale in case an invalid locale is selected.
          home: SettingsCtrl.to.onboardingDone ? const Home() : Onboarding(),
        );
      },
    );
  }
}
