import 'package:beth/helpers/beth_const.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:beth/views/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'themes/beth_theme.dart';

class Beth extends StatelessWidget {
  const Beth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Splash(),
      title: 'beth',
      debugShowCheckedModeBanner: false,
      translations: BethTranslations(),
      defaultTransition: Transition.native,
      locale: Locale(GetStorage().read(BethConst.languageCode) ?? 'en'),
      fallbackLocale: const Locale('en'),
      theme: BethTheme.light,
      darkTheme: BethTheme.dark,
      themeMode: BethTheme.themeMode,
    );
  }
}
