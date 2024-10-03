import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCtrl extends GetxController {
  /// You do not need that. I recommend using it just for ease of syntax.
  /// with static method: Controller.to.increment();
  /// with no static method: Get.find<Controller>().increment();
  /// There is no difference in performance, nor any side effect of using either syntax. Only one does not need the type, and the other the IDE will autocomplete it.
  static SettingsCtrl get to => Get.find();

  var language = Get.deviceLocale ?? const Locale('en', 'US');
  var theme = ThemeMode.system;
  var materialColor = false;
  var onboardingDone = false;

  void loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> languageList = prefs.getStringList('language') ?? <String>[];
    if (languageList.isNotEmpty) {
      language = Locale(languageList[0], languageList[1]);
      Get.updateLocale(language);
    }

    String? themeMode = prefs.getString('theme');
    if (themeMode != null) {
      if (themeMode == 'light') {
        theme = ThemeMode.light;
      } else if (themeMode == 'dark') {
        theme = ThemeMode.dark;
      } else if (themeMode == 'system') {
        theme = ThemeMode.system;
      }
    }

    bool? onboardingDone = prefs.getBool('onboardingDone');
    if (onboardingDone != null) {
      this.onboardingDone = onboardingDone;
    }
  }

  void changeLanguage(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('language', <String>[locale.languageCode, locale.countryCode ?? '']);

    language = locale;

    Get.updateLocale(locale);
  }

  void changeTheme(ThemeMode themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.name);

    Get.changeThemeMode(themeMode);
  }

  void setOnboardingDone(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingDone', value);
    onboardingDone = value;
  }
}
