import 'package:beth/helpers/beth_const.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'beth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /* RESTRICT SCREEN ORIENTATION ---------------------------------------------- */
  if (BethUtils.screenWidth <= BethConst.tabletWidth) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  /* -------------------------------------------------------------------------- */

  await GetStorage.init();

  runApp(const Beth());
}
