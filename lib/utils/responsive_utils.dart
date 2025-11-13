/*
 * Project: Flutter Starter
 * File: responsive_utils.dart
 * 
 * Created: 2024-11-13 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2025, Luca Biasotto
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveUtils {
  /// Breakpoints per determinare il tipo di dispositivo
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  /// Controlla se il dispositivo è uno smartphone
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// Controlla se il dispositivo è un tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Controlla se il dispositivo è un desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  /// Determina la design size appropriata
  static Size getDesignSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final aspectRatio = screenWidth / screenHeight;

    // Considera tablet se la larghezza è > 600dp o se l'aspect ratio è vicino a quello di un tablet
    final isTabletDevice = screenWidth > mobileBreakpoint || aspectRatio > 0.7;

    //TODO customize as you wish
    if (isTabletDevice) {
      // Design size per tablet (basata su iPad standard)
      return const Size(768, 1024);
    } else {
      // Design size per smartphone (basata su design mobile moderno)
      return const Size(375, 812); // iPhone X/11/12/13 reference
    }
  }

  /// Ottieni padding responsivo
  static EdgeInsets getResponsivePadding(
    BuildContext context, {
    double mobile = 16.0,
    double tablet = 24.0,
    double desktop = 32.0,
  }) {
    if (isMobile(context)) {
      return EdgeInsets.all(mobile.w);
    } else if (isTablet(context)) {
      return EdgeInsets.all(tablet.w);
    } else {
      return EdgeInsets.all(desktop.w);
    }
  }

  /// Ottieni dimensione del font responsiva
  static double getResponsiveFontSize(
    BuildContext context, {
    double mobile = 14.0,
    double tablet = 16.0,
    double desktop = 18.0,
  }) {
    if (isMobile(context)) {
      return mobile.sp;
    } else if (isTablet(context)) {
      return tablet.sp;
    } else {
      return desktop.sp;
    }
  }

  /// Ottieni numero di colonne responsive per grid
  static int getResponsiveColumns(
    BuildContext context, {
    int mobile = 1,
    int tablet = 2,
    int desktop = 3,
  }) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return desktop;
    }
  }

  /// Ottieni spaziatura responsiva
  static double getResponsiveSpacing(
    BuildContext context, {
    double mobile = 8.0,
    double tablet = 12.0,
    double desktop = 16.0,
  }) {
    if (isMobile(context)) {
      return mobile.w;
    } else if (isTablet(context)) {
      return tablet.w;
    } else {
      return desktop.w;
    }
  }
}
