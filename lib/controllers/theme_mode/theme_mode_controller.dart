import 'package:beth/helpers/beth_const.dart';
import 'package:beth/themes/beth_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeModeController extends GetxController {
  static final _storage = GetStorage();

  String _value = BethTheme.themeModeName;

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
    _storage.write(BethConst.themeMode, value);
    Get.changeThemeMode(BethTheme.themeMode);
    update();
  }
}
