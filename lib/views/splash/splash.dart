import 'dart:async';

import 'package:beth/helpers/beth_const.dart';
import 'package:beth/helpers/beth_images.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/auth/auth_controller.dart';
import '../landing/components/landing_components.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    
    Timer(
      const Duration(milliseconds: 1500),
      () {
        GetStorage storage = GetStorage();

        bool? isFirstLaunch = storage.read<bool>(BethConst.isFirstLaunch);

        isFirstLaunch == null
            ? Get.off(() => const Landing())
            : Get.put(AuthController(), permanent: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          BethImages.logo,
          color: BethUtils.isDarkTheme
              ? BethColors.lightPrimary1
              : BethColors.black,
        ),
      ),
    );
  }
}
