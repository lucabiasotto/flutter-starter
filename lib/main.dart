import 'package:app/controllers/controller.dart';
import 'package:app/controllers/settings.dart';
import 'package:app/widgets/home/home.dart';
import 'package:app/theme/theme.dart';
import 'package:app/translations/translation.dart';
import 'package:app/widgets/onboarding/onboarding.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Locale locale = const Locale('en', 'US');
final List appLanguages = [
  {'name': 'English', 'locale': const Locale('en', 'US')},
  {'name': 'Italiano', 'locale': const Locale('it', 'IT')},
];

void main() async {
  //Init firebase / Analytics
  /*
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalytics.instance.logAppOpen();
  */

  //Inizializza i controller
  final SettingsCtrl settings = Get.put(SettingsCtrl());
  settings.loadSettings();

  final Controller game = Get.put(Controller());
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
