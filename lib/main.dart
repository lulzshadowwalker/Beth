import 'dart:math';

import 'package:beth/controllers/auth/auth_controller.dart';
import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'beth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.lazyPut(() => CredentialsController());
  Get.put(AuthController(), permanent: true);

  /* RESTRICT SCREEN ORIENTATION ---------------------------------------------- */
  ///  ..
  ///  As far as I can tell, [Get.width] returns the relative width of the
  ///  screen depending on the orientation when launching the aplication.
  final int smallerDimension = min(Get.width.toInt(), Get.height.toInt());

  if (smallerDimension <= 744) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  /* -------------------------------------------------------------------------- */

  await GetStorage.init();

  runApp(const Beth());
}
