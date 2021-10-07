import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxf/core/utils/strings/lang/ar_db.dart';
import 'package:getxf/core/utils/strings/lang/en_us.dart';
import 'package:getxf/core/utils/strings/lang/ja_jp.dart';
import 'package:getxf/core/utils/strings/lang/pn_in.dart';
import 'package:getxf/core/utils/strings/lang/tr_tr.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('tr', 'TR');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['English', 'Türkçe', '日本語', 'ਪੰਜਾਬੀ', 'عربي'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('tr', 'TR'),
    Locale('ja', 'JP'),
    Locale('pn', 'IN'),
    Locale('ar', 'DB'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'tr_TR': trTR, // lang/tr_tr.dart
        'ja_JP': jaJP, // lang/ja_jp.dart
        'pn_IN': pnIn,
        'ar_DB': arDB,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
