import 'package:beth/helpers/beth_const.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageOptionsController extends GetxController {
  final _dropdownMenuItems = const <DropdownMenuItem<String>>[
    DropdownMenuItem(
      value: BethTranslations.englishLanguageKey,
      child: Text(BethTranslations.english),
    ),
    DropdownMenuItem(
      value: BethTranslations.arabicLanguageKey,
      child: Text(BethTranslations.arabic),
    ),
  ];

  List<DropdownMenuItem<String>>? get dropdownMenuItems =>
      List.unmodifiable(_dropdownMenuItems);

  static final _storage = GetStorage();

  String _value = BethTranslations.currentLanguageName ??
      BethTranslations.englishLanguageKey;

  get icon => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: FaIcon(
          FontAwesomeIcons.angleDown,
          size: 14,
        ),
      );

  String get value => _value;

  set value(String value) {
    _value = value;
    _storage.write(BethConst.languageCode, value);
    Get.updateLocale(Locale(value));
    update();
  }
}
