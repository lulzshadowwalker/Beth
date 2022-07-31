
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'themes/lulz_theme.dart';
import 'views/home/home.dart';

class Arrr extends StatelessWidget {
  const Arrr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Arrr',
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: LulzTheme.light,
      darkTheme: LulzTheme.dark,
    );
  }
}
