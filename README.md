# Flutter Starter

A Starter template for Flutter app.

## Preview

![App Preview](preview.gif)

## Features

1. State management with GetX.
1. Centralized loading management in GetX controllers
1. Routing with GetX.
1. Responsive design with flutter_screenutil for component sizing
1. Logging library
1. Translations:
   1. Put all translations in the `lib/translations/Translation` file
   1. Contains a simple settings screen for change language.
1. Theming
   1. Customize theme in `lib/theme/theme.dart` file
   1. Contains a simple settings screen for change theme.
1. Onboarding with slides
1. Login management example
1. Show OnBoarding widget on first launch

## What Offline DB Choose?

- Drift if it's relational database (SQL), based on Room database from Android native
- Isar for NoSQL, fastest option
- Hive if you want something simple and fast, same creator as Isar
- ObjectBox if NoSQL, fast option, has paid features, paid could mean it's much more maintained than the other options
- Plain SQLite (Sqflite) is slower compared to the above list but much more stable.
- Something simple, use Shared Preferences
- Something simple and secure, use Secure Storage (uses native Android KeyStore and iOS Keychain)

## What Online DB Choose?

- Supabase: based on postgress, free, open source, cloud or self-hosted
- Firebase: nosql, free, cloud

## Need auth?

- Supabase Auth: free, open source, cloud or self-hosted
- Firebase Auth: free, cloud
