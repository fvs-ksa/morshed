// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "boardingTitle1": "شخص تائه ؟",
  "boardingTitle2": "تريد ارشاد",
  "boardingSubTitle1": "قم بالتبليغ عن الشخص التائه",
  "boardingSubTitle2": "احصل على جميع الارشادات الخاصه بك"
};
static const Map<String,dynamic> en = {
  "boardingTitle1": "Lost person ?",
  "boardingTitle2": "You want guidance",
  "boardingSubTitle1": "Report the lost person",
  "boardingSubTitle2": "Get all your instructions"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
