/*
 * Project: Flutter Starter
 * File: theme.dart
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2024, Luca Biasotto
 */

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData baseLigth = ThemeData.light(useMaterial3: true);
final ThemeData baseDark = ThemeData.dark(useMaterial3: true);

const Color lightColor = Colors.white;
const Color darkColor = Color.fromARGB(221, 19, 19, 19); //Color.fromRGBO(30, 30, 30, 1);

ColorScheme colorSchemeLight = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(243, 96, 13, 1),
  brightness: Brightness.light,
);
ColorScheme colorSchemeDark = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(103, 58, 183, 1),
  brightness: Brightness.dark,
);

ThemeData getLightTheme(Color? color, ColorScheme? colorScheme) {
  color ??= lightColor;
  final cardColor = darken(color, 5);

  return baseLigth.copyWith(
    brightness: Brightness.light,
    colorScheme: colorScheme
        ?.copyWith(
          brightness: Brightness.light,
          background: color,
          surface: baseLigth.colorScheme.background,
        )
        .harmonized(),
    textTheme: GoogleFonts.ubuntuTextTheme(baseLigth.textTheme),
    appBarTheme: AppBarTheme(
      //backgroundColor: color,
      //foregroundColor: baseLigth.colorScheme.onSurface,
      //shadowColor: Colors.transparent,
      //surfaceTintColor: Colors.transparent,
      elevation: 2,
    ),
    primaryColor: color,
    canvasColor: color,
    scaffoldBackgroundColor: color,
    cardColor: cardColor,
    cardTheme: baseLigth.cardTheme.copyWith(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.transparent,
    ),
    bottomSheetTheme: baseLigth.bottomSheetTheme.copyWith(
      backgroundColor: color,
    ),
    navigationRailTheme: baseLigth.navigationRailTheme.copyWith(
      backgroundColor: color,
    ),
    navigationBarTheme: baseLigth.navigationBarTheme.copyWith(
      backgroundColor: color,
    ),
    inputDecorationTheme: baseLigth.inputDecorationTheme.copyWith(
      labelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          return const TextStyle(fontSize: 14);
        },
      ),
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
    ),
    indicatorColor: Colors.black,
  );
}

ThemeData getDarkTheme(Color? color, ColorScheme? colorScheme) {
  color ??= darkColor;
  final cardColor = lighten(color, 5);

  return baseDark.copyWith(
    brightness: Brightness.dark,
    colorScheme: colorScheme
        ?.copyWith(
          brightness: Brightness.dark,
          background: color,
          surface: baseDark.colorScheme.background,
        )
        .harmonized(),
    textTheme: GoogleFonts.ubuntuTextTheme(baseDark.textTheme),
    appBarTheme: AppBarTheme(
      //backgroundColor: color,
      //foregroundColor: baseDark.colorScheme.onSurface,
      //shadowColor: Colors.transparent,
      //surfaceTintColor: Colors.transparent,
      elevation: 2,
    ),
    primaryColor: color,
    canvasColor: color,
    scaffoldBackgroundColor: color,
    cardColor: cardColor,
    cardTheme: baseDark.cardTheme.copyWith(
      elevation: 0,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.transparent,
    ),
    bottomSheetTheme: baseDark.bottomSheetTheme.copyWith(
      backgroundColor: color,
    ),
    navigationRailTheme: baseDark.navigationRailTheme.copyWith(
      backgroundColor: color,
    ),
    navigationBarTheme: baseDark.navigationBarTheme.copyWith(
      backgroundColor: color,
    ),
    inputDecorationTheme: baseDark.inputDecorationTheme.copyWith(
      labelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          return const TextStyle(fontSize: 14);
        },
      ),
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
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
