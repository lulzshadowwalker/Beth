import 'package:beth/controllers/auth/auth_controller.dart';
import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'beth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => CredentialsController());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Beth());
}
