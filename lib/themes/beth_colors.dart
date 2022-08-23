import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BethColors {
  /// #FFFFFF -> FFFFFF
  static Color colorFromHex(String hexColor, [String opacity = 'FF']) {
    /// #FFFFFF -> FFFFFF
    final String color = hexColor.replaceAll('#', '');

    /// FFFFFFFF -> 0xFFFFFFFF
    return Color(int.parse(opacity + color, radix: 16));
  }

  /// returns [true] if the theme is dark and [false] if the theme is light
  static bool get _checkBrightness => Get.theme.brightness == Brightness.dark;

  Color primary1 = _checkBrightness ? darkPrimary1 : lightPrimary1;

  static Color primary2 = colorFromHex('09BC8A');

  /// opposite of the current theme. darkmode -> white, lightmode -> black
  Color neutral1 = _checkBrightness ? Colors.white : Colors.black;

  /// same as the current theme. lightmode -> white, lightmode -> black
  Color neutral2 = _checkBrightness ? Colors.black : Colors.white;



  static final Color lightPrimary1 = colorFromHex('F1EDEE');
  static final Color darkPrimary1 = colorFromHex('1C1B22');
  static final Color secondary1 = colorFromHex('00999F');
  static final Color accent1 = colorFromHex('6290C3');
  static final Color accent2 = colorFromHex('48D46B');
  static final Color red = colorFromHex('DB5461');
  static final Color green = colorFromHex('96F550');
  static const Color grey = Colors.grey;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static final LinearGradient gradient1 = LinearGradient(
    colors: [Colors.black, secondary1],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
