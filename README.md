# Flutter Starter

A Starter template for Flutter app.

## Features

1. State management with GetX.
1. Routing with GetX.
1. Translations:
   1. Put all translations in the `lib/translations/Translation` file
   1. Contains a simple settings screen for change language.
1. Theming
   1. Customize theme in `lib/theme/theme.dart` file
   1. Contains a simple settings screen for change theme.
1. Show OnBoarding widget on first launch

## What DB Choose?

- Drift if it's relational database (SQL), based on Room database from Android native
- Isar for NoSQL, fastest option
- Hive if you want something simple and fast, same creator as Isar
- ObjectBox if NoSQL, fast option, has paid features, paid could mean it's much more maintained than the other options
- Plain SQLite (Sqflite) is slower compared to the above list but much more stable.
- Something simple, use Shared Preferences
- Something simple and secure, use Secure Storage (uses native Android KeyStore and iOS Keychain)

## Need auth?

- Firebase Auth: free, cloud
- Supabase Auth: free, open source, cloud or self-hosted
