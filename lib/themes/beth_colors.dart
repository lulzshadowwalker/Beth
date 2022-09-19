import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/themes/beth_theme.dart';
import 'package:flutter/material.dart';

class BethColors {
  /// #FFFFFF -> FFFFFF
  static Color colorFromHex(String hexColor, [String opacity = 'FF']) {
    /// #FFFFFF -> FFFFFF
    final String color = hexColor.replaceAll('#', '');

    /// FFFFFFFF -> 0xFFFFFFFF
    return Color(int.parse(opacity + color, radix: 16));
  }

  Color primary1 = BethUtils.isDarkTheme ? darkPrimary1 : lightPrimary1;

  static Color primary2 = colorFromHex('09BC8A');

  /// opposite of the current theme. darkmode -> white, lightmode -> black
  static Color get neutral1 =>
      BethUtils.isDarkTheme ? Colors.white : Colors.black;

  /// same as the current theme. lightmode -> white, lightmode -> black
  static Color get neutral2 =>
      BethUtils.isDarkTheme ? Colors.black : Colors.white;

  static Color get accent => BethTheme.isLight ? accent2 : accent1;

  static Color get primary => BethTheme.isLight ? lightPrimary1 : darkPrimary1;
  static Color get secondary => BethTheme.isLight ? secondary1 : secondary2;

  static final Color lightPrimary1 = colorFromHex('F9F9FB');
  static final Color darkPrimary1 = colorFromHex('1C1B22');
  static final Color secondary1 = colorFromHex('285656');
  static final Color secondary1Dimmed = colorFromHex('1F4948');
  static final Color secondary2 = colorFromHex('BB8A52');
  static final Color accent1 = colorFromHex('FD7612');
  static final Color accent2 = colorFromHex('6D9773');
  static final Color red = colorFromHex('DB5461');
  static final Color green = colorFromHex('96F550');
  static final Color muted = colorFromHex('999999');
  static const Color grey = Colors.grey;
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static final LinearGradient gradient1 = LinearGradient(
    colors: [Colors.black, secondary1],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
