import 'package:beth/locale/beth_translations.dart';
import 'package:beth/views/auth/sign_in/components/sign_in_components.dart';
import 'package:beth/views/auth/sign_up/components/sign_up_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'themes/beth_theme.dart';

class Beth extends StatelessWidget {
  const Beth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'beth',
      home: SignIn(),
      debugShowCheckedModeBanner: false,
      translations: BethTranslations(),
      defaultTransition: Transition.native,
      locale: Locale(Get.deviceLocale?.languageCode ?? 'en'),
      fallbackLocale: const Locale('en'),
      theme: BethTheme.light,
      darkTheme: BethTheme.dark,
    );
  }
}
