import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BethTheme {
  static final String? _enFontFamily = GoogleFonts.poppins().fontFamily;
  static final String? _arFontFamily = GoogleFonts.tajawal().fontFamily;
  static final TextTheme _textTheme = Get.textTheme.apply(
    /// displayColor ~>  headline4, headline3, headline2, headline1, and caption
    /// bodyColor  ~> is applied to the remaining text styles.

    fontFamily:
        Get.locale == const Locale('ar') ? _arFontFamily : _enFontFamily,
  );

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
          ),
    );
  }
  //
  // ────────────────────────────────────────────────────────────── LIGHT THEME ─────
  //

}
