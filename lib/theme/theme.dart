/*
 * Project: Flutter Starter
 * File: theme.dart
 * 
 * 
 * This theme manages both light and dark themes, ensuring that the primary
 * color is the same for both.
 * 
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2024, Luca Biasotto
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color paletteColor1 =  Color.fromRGBO(243, 96, 13, 1);
const Color paletteColor2 = Color(0xFF9BC26D);
const Color paletteColor3 = Color(0xFFddd997);
const Color paletteColor4 = Color(0xFF575531);
const Color primarytColor = paletteColor1;

final ThemeData baseLigth = ThemeData.light(useMaterial3: true);
final ThemeData baseDark = ThemeData.dark(useMaterial3: true);

ColorScheme colorSchemeLight = ColorScheme.fromSeed(
  seedColor: primarytColor,
  brightness: Brightness.light,
).copyWith(
  primary: primarytColor, //mi assicuro che il primario non venga sovrascritto
);

ColorScheme colorSchemeDark = ColorScheme.fromSeed(
  seedColor: primarytColor,
  brightness: Brightness.dark,
).copyWith(
  primary: primarytColor, //mi assicuro che il primario non venga sovrascritto
);

const appBarThemeBase = AppBarTheme(
  backgroundColor: primarytColor,
);

/// Returns the light theme for the application.
ThemeData getLightTheme() {
  final cardColor = baseLigth.colorScheme.surface; //darken(baseLigth.colorScheme.background, 5);

  return baseLigth.copyWith(
    textTheme: GoogleFonts.nunitoTextTheme(baseLigth.textTheme),
    brightness: Brightness.light,
    primaryColor: primarytColor,
    primaryColorDark: darken(primarytColor, 50),
    primaryColorLight: lighten(primarytColor, 50),
    colorScheme: colorSchemeLight,
    appBarTheme: appBarThemeBase.copyWith(
      foregroundColor: Colors.white,
    ),
    cardColor: cardColor,
    cardTheme: baseLigth.cardTheme.copyWith(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.transparent,
    ),
  );
}

/// Returns the dark theme for the application.
ThemeData getDarkTheme() {
  final cardColor = baseDark.colorScheme.surface; //lighten(baseDark.colorScheme.background, 5);

  return baseDark.copyWith(
    textTheme: GoogleFonts.nunitoTextTheme(baseDark.textTheme),
    brightness: Brightness.dark,
    primaryColor: primarytColor,
    primaryColorDark: darken(primarytColor, 50),
    primaryColorLight: lighten(primarytColor, 50),
    colorScheme: colorSchemeDark,
    appBarTheme: appBarThemeBase.copyWith(
      foregroundColor: Colors.black,
    ),
    cardColor: cardColor,
    cardTheme: baseLigth.cardTheme.copyWith(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.transparent,
    ),
  );
}

/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(), (c.blue * f).round());
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(c.alpha, c.red + ((255 - c.red) * p).round(), c.green + ((255 - c.green) * p).round(), c.blue + ((255 - c.blue) * p).round());
}
