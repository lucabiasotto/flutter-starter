/*
 * Project: Flutter Starter
 * File: utils.dart
 * 
 * Created: 2024-12-22 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2024, Luca Biasotto
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Export delle utilità responsive
export 'responsive_utils.dart';

/// Shows a dialog and resolves to true when the user has indicated that they
/// want to pop.
///
/// A return value of null indicates a desire not to pop, such as when the
/// user has dismissed the modal without tapping a button.
Future<bool?> showBackDialog(
  context, {
  String? message,
}) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('are_you_sure'.tr),
        content: Text(message ?? 'are_you_sure'.tr),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text('no'.tr),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text('yes'.tr),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  );
}

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

bool isDarkColor(Color color) {
  return color.computeLuminance() <= 0.5;
}
