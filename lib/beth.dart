import 'package:beth/helpers/beth_const.dart';
import 'package:beth/services/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'themes/beth_theme.dart';
import 'views/home/home.dart';

class Beth extends StatelessWidget {
  const Beth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: BethConst.mobileDesignSize,
      builder: ((context, child) => 
      GetMaterialApp(
        title: 'beth',
        home: const Home(),
        debugShowCheckedModeBanner: false,
        translations: BethTranslations(),
        locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        theme: LulzTheme.light,
        darkTheme: LulzTheme.dark,
      ))
    );
  }
}
