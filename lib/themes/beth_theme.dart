import 'package:beth/locale/beth_translations.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/beth_const.dart';

class BethTheme {
  static final String? _enFontFamily = GoogleFonts.poppins().fontFamily;
  static final String? _arFontFamily = GoogleFonts.tajawal().fontFamily;
  static final TextTheme _textTheme = Get.textTheme.apply(
        /// displayColor ~>  headline4, headline3, headline2, headline1, and caption
        /// bodyColor  ~> is applied to the remaining text styles.

        fontFamily:
            Get.locale == const Locale('ar') ? _arFontFamily : _enFontFamily,
      );

  /// returns a map of all the currently supported themes and their corresponding names
  static Map<Brightness, String> get themes => {
        Brightness.dark: BethTranslations.dark.tr,
        Brightness.light: BethTranslations.light.tr,
      };

  /// returns the language name of the current locale
  static String? get currentThemeName => themes[Get.theme.brightness];

  /// returns [true] if current theme's brightness is [Brightness.light]
  static bool get isLight => Get.theme.brightness == Brightness.light;

  /// returns light by default, unless changed by the user in the settings.
  static ThemeMode get themeMode {
    final storage = GetStorage();

    final themeMode = storage.read<String>(BethConst.themeMode);
    switch (themeMode) {
      case BethConst.systemDefault:
        return ThemeMode.system;
      case BethConst.light:
        return ThemeMode.light;
      case BethConst.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }

  static String get themeModeName {
    Map<ThemeMode, String> themeModes = {
      ThemeMode.light: BethConst.light,
      ThemeMode.dark: BethConst.dark,
      ThemeMode.system: BethConst.systemDefault
    };

    return themeModes[themeMode]!;
  }

  //
  // ─── DARK THEME ─────────────────────────────────────────────────────────────────
  //
  static ThemeData get dark {
    Color textColor = BethColors.white;

    return ThemeData.dark().copyWith(
        useMaterial3: true,

        //
        colorScheme:
            ThemeData.dark().colorScheme.copyWith(primary: BethColors.accent2),

        //
        textTheme: _textTheme.apply(
          bodyColor: textColor,
          displayColor: textColor,
        ),

        //
        scaffoldBackgroundColor: BethColors.darkPrimary1,

        //
        dividerTheme: const DividerThemeData(
          color: BethColors.white,
          thickness: 1,
          indent: 15,
          endIndent: 15,
        ),

        //
        appBarTheme: ThemeData().appBarTheme.copyWith(
              color: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              scrolledUnderElevation: 0,
            ));
  }
  //
  // ─────────────────────────────────────────────────────────────── DARK THEME ─────
  //

  //
  // ─── LIGHT THEME ────────────────────────────────────────────────────────────────
  //
  static ThemeData get light {
    Color textColor = BethColors.black;

    return ThemeData.light().copyWith(
      useMaterial3: true,

      //
      colorScheme:
          ThemeData.light().colorScheme.copyWith(primary: BethColors.accent2),

      //
      textTheme: _textTheme.apply(
        bodyColor: textColor,
        displayColor: textColor,
      ),

      //
      scaffoldBackgroundColor: BethColors.lightPrimary1,

      //
      dividerTheme: const DividerThemeData(
        color: BethColors.black,
        thickness: 1,
        indent: 15,
        endIndent: 15,
      ),

      //
      appBarTheme: ThemeData().appBarTheme.copyWith(
            color: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            scrolledUnderElevation: 0,
          ),
    );
  }
  //
  // ────────────────────────────────────────────────────────────── LIGHT THEME ─────
  //

}
