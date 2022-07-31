import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// TODO: customize the app theme.

class LulzTheme {
  static final String? _fontFamily = GoogleFonts.firaCode().fontFamily;
  static final TextTheme _textTheme = Get.textTheme.apply(
    /// displayColor ~>  headline4, headline3, headline2, headline1, and caption
    /// bodyColor  ~> is applied to the remaining text styles.
    bodyColor: Colors.white,
    displayColor: Colors.white,
    fontFamily: _fontFamily,
  );

  //
  // ─── DARK THEME ─────────────────────────────────────────────────────────────────
  //
  static ThemeData get dark {
    Color textColor = Colors.white;

    return ThemeData.dark().copyWith(
      /// * text theme
      textTheme: _textTheme.apply(
        bodyColor: textColor,
        displayColor: textColor,
      ),
    );
  }
  //
  // ─────────────────────────────────────────────────────────────── DARK THEME ─────
  //

  //
  // ─── LIGHT THEME ────────────────────────────────────────────────────────────────
  //
  static ThemeData get light {
    Color textColor = Colors.black;
    return ThemeData.light().copyWith(
      /// * text theme
      textTheme: _textTheme.apply(
        bodyColor: textColor,
        displayColor: textColor,
      ),
    );
  }
  //
  // ────────────────────────────────────────────────────────────── LIGHT THEME ─────
  //

}
